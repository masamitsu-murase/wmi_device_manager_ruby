require_relative 'test_helper'

class WmiDeviceManagerTest < Test::Unit::TestCase
  def test_that_it_has_a_version_number
    assert_not_nil WmiDeviceManager::VERSION
  end
end
