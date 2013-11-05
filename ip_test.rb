require 'test/unit'
require './ip.rb'

class TestIP < Test::Unit::TestCase
  def test_equals
    assert_equal IP.new("192.168.0.110"), IP.new("192.168.0.110")
  end

  def test_addition
    ip = IP.new("255.255.255.10")
    ip_inc = ip + 1
    assert_equal ip_inc.to_s, "255.255.255.11"
  end

  def test_and
    ip1 = IP.new("192.168.1.14")
    ip2 = IP.new("0.0.0.255")
    assert_equal (ip1 & ip2), IP.new("0.0.0.14")
  end

  def test_to_i
    assert_equal IP.new("0.0.0.0").to_i, 0x00000000
    assert_equal IP.new("255.255.255.255").to_i, 0xffffffff
  end

  def test_to_s
    assert_equal IP.from_i(0x00000000).to_s, "0.0.0.0"
    assert_equal IP.from_i(0xffffffff).to_s, "255.255.255.255"
    assert_equal IP.from_i(0xffffff00).to_s, "255.255.255.0"
  end

  def test_inverse
    assert_equal IP.new("10.1.10.13"), IP.from_i(IP.new("10.1.10.13").to_i)
  end
end


