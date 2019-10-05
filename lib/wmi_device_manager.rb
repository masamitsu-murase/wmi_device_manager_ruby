
require("win32ole")
require("wmi_device_manager/device_manager")
require("wmi_device_manager/win32pnpentity")
require("wmi_device_manager/const")

module WmiDeviceManager
    def self.wrap_raw_wmi_object(obj)
        if obj.kind_of? Array
            return obj.map{ |i| wrap_raw_wmi_object(i) }
        end

        begin
            if obj.Methods_ && obj.Properties_
                return Win32PnpEntity.new(obj)
            end
        rescue NoMethodError
        end

        return obj
    end
end
