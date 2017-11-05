
require("win32ole")

module WmiDeviceManager
    class DeviceManager
        include Enumerable

        def initialize(construct_device_tree=true)
            @wmi = WIN32OLE.connect("winmgmts:\\\\.\\root\\cimv2")
            @root = nil
            scan_derive_tree()
            if construct_device_tree
                self.construct_device_tree()
            end
        end

        def scan_derive_tree
            @device_list = @wmi.ExecQuery("SELECT * from Win32_PnPEntity").to_enum(:each).map do |i|
                next WmiDeviceManager.wrap_raw_wmi_object(i)
            end
        end

        def construct_device_tree
            device_hash = {}
            @device_list.each do |device|
                device_hash[device.DeviceID.upcase] = {
                    device: device,
                    parent: nil,
                    children: []
                }
            end

            device_hash.each_value do |value|
                parent_id = value[:device].Parent
                if parent_id 
                    parent = device_hash[parent_id.upcase]
                    if parent
                        parent[:children].push(value[:device])
                        value[:parent] = parent[:device]
                    end
                else
                    @root = value[:device]
                end
            end

            device_hash.each_value do |value|
                value[:device].set_relationship(value[:parent], value[:children])
            end
        end

        def each
            @device_list.each do |item|
                yield item
            end
        end
    end
end
