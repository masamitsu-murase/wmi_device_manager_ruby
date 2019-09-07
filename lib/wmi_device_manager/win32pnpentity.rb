
require("win32ole")

module WmiDeviceManager
    class Win32PnpEntity
        def initialize(wmi_object)
            @wmi_object = wmi_object
            @parent = nil
            @children = nil
            @properties_list = wmi_object.Properties_.to_enum(:each).map{ |i| i.Name }
            @methods_list = wmi_object.Methods_.to_enum(:each).map{ |i| i.Name }
        end

        def parent
            raise "Not constructed yet" if @children == nil
            return @parent
        end

        def children
            raise "Not constructed yet" if @children == nil
            return @children
        end

        def set_relationship(parent, children)
            @parent = parent
            @children = children
        end

        def method_missing(name_sym, *args)
            name = name_sym.to_s
            if @properties_list.include? name
                return WmiDeviceManager.wrap_raw_wmi_object(@wmi_object.Properties_.Item(name).Value)
            elsif @methods_list.include? name
                return call_method(name, args)
            else
                const_list = DEVPKEY_LIST
                prop_value = nil
                const_list.each do |const_name|
                    const_value = WmiDeviceManager.const_get(const_name)
                    if const_value.include?(name)
                        prop_value = self.GetDeviceProperties(["DEVPKEY_#{const_name}_#{name}"]).deviceProperties[0]
                        break
                    elsif name.start_with?("#{const_name}_") && const_value.include?(name[(const_name.size + 1) .. -1])
                        prop_value = self.GetDeviceProperties(["DEVPKEY_#{name}"]).deviceProperties[0]
                        break
                    elsif name.start_with?("DEVPKEY_#{const_name}_") && const_value.include?(name[(8 + const_name.size + 1) .. -1])
                        prop_value = self.GetDeviceProperties([name]).deviceProperties[0]
                        break
                    end
                end
                if prop_value
                    return prop_value.Type == 0 ? nil : prop_value.Data
                end
            end
            super
        end

        private
        def call_method(name, args)
            params = @wmi_object.Methods_.Item(name).inParameters&.SpawnInstance_
            if params
                params.Properties_.each do |param|
                    param_id = param.Qualifiers_.Item("ID").Value
                    param.Value = args[param_id] if param_id < args.size
                    # named arg is not supported yet.
                end
            end
            return WmiDeviceManager.wrap_raw_wmi_object(@wmi_object.ExecMethod_(name, params))
        end
    end
end
