require 'test/unit'
require './ip.rb'

class TestIP < Test::Unit::TestCase
  def test_equals
    assert_equal IP.new("192.168.0.110"), IP.new("192.168.0.110")
  end

  def test_to_i
    assert_equal IP.new("0.0.0.0").to_i, 0x00000000
    assert_equal IP.new("255.255.255.255").to_i, 0xffffffff
  end

  def test_inverse
    assert_equal IP.new("10.1.10.13"), IP.from_i(IP.new("10.1.10.13").to_i)
  end
end


