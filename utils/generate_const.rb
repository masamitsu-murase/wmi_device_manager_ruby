
require 'set'

def find_all_keys(dll_path)
  pattern = "DEVPKEY_".encode("utf-16le").b + "(?:[_a-zA-Z0-9]\x00)+".b
  content = File.open(dll_path, "rb", &:read)
  return content.scan(Regexp.compile(pattern)).map{|m| m.encode("ascii", "utf-16le")}
end

def parse_keys(keys)
  key_tree = {}
  keys.each do |key|
    splitted_key = key.split("_", 3)
    next unless splitted_key.size == 3

    _, group, name = splitted_key
    key_tree[group] = SortedSet.new unless key_tree.key? group
    key_tree[group].add(name)
  end
  return key_tree
end

def output_const(key_tree)
  special_groups = [
    "Device",
    "DeviceContainer",
    "FirmwareResource",
    "PciDevice",
    "PciRootBus",
  ]

  output = "module WmiDeviceManager\n"
  key_tree.keys.sort.each do |key|
    set = key_tree[key]
    output += "#{key} = [\n"
    set.each do |name|
      output += "    \"#{name}\",\n"
    end
    output += "]\n\n"
  end

  output += "DEVPKEY_LIST = {\n"
  output += "    # special groups\n"
  special_groups.each do |key|
      output += "    \"#{key}\" => #{key},\n"
  end
  output += "    # other groups\n"
  key_tree.keys.sort.each do |key|
    set = key_tree[key]
    line = "\"#{key}\" => #{key},"
    if special_groups.include? key
      output += "    # #{line}\n"
    else
      output += "    #{line}\n"
    end
  end
  output += "}\n\n"
  output += "end\n"

  return output
end

def usage
  puts "Usage: generate_const.rb cimwin32_dll output_const_rb"
  puts "   e.g. cimwin32_dll: C:/Windows/System32/wbem/cimwin32.dll"
end

if $0 == __FILE__
  unless ARGV.length == 2
    usage
    exit -1
  end

  output = output_const(parse_keys(find_all_keys(ARGV[0])))
  File.open(ARGV[1], "w") do |file|
    file.write(output)
  end
end
