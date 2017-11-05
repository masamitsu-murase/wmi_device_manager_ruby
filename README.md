
# WMI Device Manager

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

Copyright 2017 Masamitsu MURASE

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.