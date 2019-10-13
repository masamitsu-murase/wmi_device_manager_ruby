
require("win32ole")

module WmiDeviceManager
    class Win32PnpEntity
        def self.construct_long_name
            long_name_hash = {}
            DEVPKEY_LIST.each do |name, values|
                values.each do |value|
                    long_name = "DEVPKEY_#{name}_#{value}"
                    [value, "#{name}_#{value}", "DEVPKEY_#{name}_#{value}"].each do |short_name|
                        long_name_hash[short_name] = long_name unless long_name_hash.key? short_name
                    end
                end
            end
            return long_name_hash
        end

        def self.const_long_name
            @long_name ||= construct_long_name
            return @long_name
        end

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
            elsif Win32PnpEntity.const_long_name.key? name
                prop_value = self.GetDeviceProperties([Win32PnpEntity.const_long_name[name]]).deviceProperties[0]
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
