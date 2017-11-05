
import comtypes
import comtypes.client as cc

from .win32pnpentity import wrap_raw_wmi_object

class WmiDeviceManager(object):
    def __init__(self, construct_device_tree=True):
        self._wmi = cc.CoGetObject(r"winmgmts:\\.\root\cimv2")
        self._root = None
        self.scan_device_tree()
        if construct_device_tree:
            self.construct_device_tree()

    @property
    def root(self):
        if self._root is None:
            raise Exception("Device tree not constructed.")
        return self._root

    def scan_device_tree(self):
        self._device_list = tuple(wrap_raw_wmi_object(i) for i in self._wmi.ExecQuery("SELECT * from Win32_PnPEntity"))

    def construct_device_tree(self):
        device_hash = {}
        for device in self:
            device_hash[device.DeviceID.upper()] = {
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
