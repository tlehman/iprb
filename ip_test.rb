require 'test/unit'

class TestIP < Test::Unit::TestCase
  def equals_test
    assert_equal IP.new("192.168.0.110"), IP.new("192.168.0.110")
  end
end


