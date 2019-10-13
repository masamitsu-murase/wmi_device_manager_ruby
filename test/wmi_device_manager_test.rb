require_relative 'test_helper'

class WmiDeviceManagerTest < Test::Unit::TestCase
  def test_version
    assert_not_nil WmiDeviceManager::VERSION
  end

  def test_pci0_device
    wdm = WmiDeviceManager::DeviceManager.new
    device = wdm.find{ |i| i.BiosDeviceName == "\\_SB.PCI0" }
    assert_not_nil device
    assert_equal "\\_SB.PCI0", device.BiosDeviceName
    assert_equal "\\_SB.PCI0", device.Device_BiosDeviceName
    assert_equal "\\_SB.PCI0", device.DEVPKEY_Device_BiosDeviceName
  end
end
