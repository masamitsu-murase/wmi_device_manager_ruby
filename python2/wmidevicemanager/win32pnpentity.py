
import types

from . import const

def wrap_raw_wmi_object(obj):
    if type(obj) == tuple:
        return tuple(wrap_raw_wmi_object(x) for x in obj)
    elif type(obj) == list:
        return [wrap_raw_wmi_object(x) for x in obj]
    elif hasattr(obj, "Properties_") and hasattr(obj, "Methods_"):
        return Win32PnpEntity(obj)
    else:
        return obj

class Win32PnpEntity(object):
    def __init__(self, wmi_object):
        self._wmi_object = wmi_object
        self._properties_list = set(x.Name for x in wmi_object.Properties_)
        self._methods_list = set(x.Name for x in wmi_object.Methods_)
        self._parent = None
        self._children = None

    @property
    def raw_object(self):
        return self._wmi_object

    @property
    def parent(self):
        if self._children is None:
            raise Exception("Not constructed yet.")
        return self._parent

    @property
    def children(self):
        if self._children is None:
            raise Exception("Not constructed yet.")
        return self._children

    def set_relationship(self, parent, children):
        self._parent = parent
        self._children = tuple(children)

    def __setattr__(self, key, value):
        if hasattr(self, "_properties_list") and key in self._properties_list:
            self._wmi_object.Properties_[key].Value = value
        else:
            super(Win32PnpEntity, self).__setattr__(key, value)

    def __getattr__(self, key):
        if key in {"_properties_list", "_methods_list", "_wmi_object", "_parent", "_children"}:
            if key in self.__dict__:
                return self.__dict__[key]
            else:
                raise AttributeError

        if key in self._properties_list:
            return wrap_raw_wmi_object(self._wmi_object.Properties_[key].Value)
        elif key in self._methods_list:
            return self._wrap_method(key)
        else:
            pair = const.DEVPKEY_LIST
            prop_value = None
            for name, values in pair:
                if key in values:
                    prop_value = self.GetDeviceProperties(["DEVPKEY_" + name + "_" + key]).deviceProperties[0]
                    break
                elif key.startswith(name + "_") and key[len(name) + 1:] in values:
                    prop_value = self.GetDeviceProperties(["DEVPKEY_" + key]).deviceProperties[0]
                    break
                elif key.startswith("DEVPKEY_" + name + "_") and key[8 + len(name) + 1:] in values:
                    prop_value = self.GetDeviceProperties([key]).deviceProperties[0]
                    break
            if prop_value:
                if prop_value.Type == 0:
                    return None
                else:
                    return prop_value.Data
            if key in self.__dict__:
                return self.__dict__[key]
            else:
                raise AttributeError

    def _wrap_method(self, method_name):
        def wmi_method(self, *args, **kwargs):
            in_parameters = self._wmi_object.Methods_[method_name].inParameters
            if in_parameters:
                params = in_parameters.SpawnInstance_()
                for param in params.Properties_:
                    param_id = param.Qualifiers_["ID"].Value
                    if param_id < len(args):
                        param.Value = args[param_id]
                    name = param.Name
                    if name in kwargs:
                        param.Value = kwargs[name]
            else:
                params = None
            return wrap_raw_wmi_object(self._wmi_object.ExecMethod_(method_name, params))
        return types.MethodType(wmi_method, self, Win32PnpEntity)
