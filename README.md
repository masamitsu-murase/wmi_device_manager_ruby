
# WMI Device Manager

[![Build status](https://ci.appveyor.com/api/projects/status/5n4gt33gmd9clo0m/branch/master?svg=true)](https://ci.appveyor.com/project/masamitsu-murase/pausable-unittest/branch/master)

This is a library to get information in device manager on Windows10 based on WMI.

You can get almost all information of device manager via this library.  
For example, "BIOS Device Name", "Driver INF Path" and so on.

## Library for Python

Use files in `python2` directory or `python3` directory based on your python engine.

You need to install `comtypes` library.

```python
import wmidevicemanager
wmi = wmidevicemanager.WmiDeviceManager()
for x in wmi:
    print(x.DeviceID)

pci_root = next(x for x in wmi if x.BiosDeviceName == r"\_SB.PCI0")
for child in pci_root.children:
    print(child.DeviceID)

for device in wmi:
    if device.BiosDeviceName == r"\_SB.PCI0.RP01.PXSX" or device.BiosDeviceName == r"\_SB.PCI0.RP02.PXSX":
        device.Disable()
```

## Library for Ruby

Use files in `ruby` directory.

This library uses `win32ole` built-in library.

Note that `respond_to_missing?` is not implemented yet.

```ruby
require "wmi_device_manager"

wmi = WmiDeviceManager::DeviceManager.new
wmi.each do |device|
    puts device.DeviceID
end

pci_root = wmi.find{ |x| x.BiosDeviceName == "\\_SB.PCI0" }
pci_root.children.each do |child|
    puts child.DeviceID
end

wmi.each do |device|
    if device.BiosDeviceName == "\\_SB.PCI0.RP01.PXSX" || device.BiosDeviceName == "\\_SB.PCI0.RP02.PXSX"
        device.Disable
    end
end
```

# License

Please use this library under MIT License

See LICENSE file.
