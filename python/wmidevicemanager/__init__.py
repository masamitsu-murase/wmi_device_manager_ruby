
import types

import comtypes
import comtypes.client as cc

from . import const

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
        if key in self._properties_list:
            return wrap_raw_wmi_object(self._wmi_object.Properties_[key].Value)
        elif key in self._methods_list:
            return self._wrap_method(key)
        else:
            pair = (("Bluetooth", const.Bluetooth), ("Device", const.Device),
                ("DeviceContainer", const.DeviceContainer), ("DrvPkg", const.DrvPkg),
                ("PciDevice", const.PciDevice), ("PciRootBus", const.PciRootBus))
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
            return self.__dict__[key]

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

def wrap_raw_wmi_object(obj):
    if type(obj) == tuple:
        return tuple(wrap_raw_wmi_object(x) for x in obj)
    elif type(obj) == list:
        return [wrap_raw_wmi_object(x) for x in obj]
    elif hasattr(obj, "Properties_") and hasattr(obj, "Methods_"):
        return Win32PnpEntity(obj)
    else:
        return obj

class WmiDeviceManager(object):
    def __init__(self, construct_device_tree=True):
        self._wmi = cc.CoGetObject(r"winmgmts:\\.\root\cimv2")
        self._root = None
        self.scan_device_tree()
        if construct_device_tree:
            self.construct_device_tree()

    @property
    def root(self):
        return self._root

    def scan_device_tree(self):
        self._device_list = tuple(wrap_raw_wmi_object(i) for i in self._wmi.ExecQuery("SELECT * from Win32_PnPEntity"))

    def construct_device_tree(self):
        device_hash = {}
        for device in self:
            device_hash[device.PNPDeviceID.upper()] = {
                "device": device,
                "parent": None,
                "children": []
            }
        for value in device_hash.itervalues():
            parent_id = value["device"].Parent
            if parent_id is None:
                self._root = value["device"]
            else:
                parent = device_hash.get(parent_id.upper())
                if parent:
                    parent["children"].append(value["device"])
                    value["parent"] = parent["device"]
        for value in device_hash.itervalues():
            value["device"].set_relationship(value["parent"], value["children"])

    def __iter__(self):
        return iter(self._device_list)

    @property
    def device_list(self):
        return self._device_list
