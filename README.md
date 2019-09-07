
# WMI Device Manager

This is a library to get information in device manager on Windows10 based on WMI.

You can get almost all information of device manager via this library.  
For example, "BIOS Device Name", "Driver INF Path" and so on.

## Library for Ruby

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
