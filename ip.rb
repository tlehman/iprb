class IP
  def initialize(ip_str)
    @octets = ip_str.split(".").map(&:to_i)
  end

  def ==(ip)
    self.to_i == ip.to_i
  end

  def to_i
    @octets.each_with_index.map { |o,i| o*(256**(3-i)) }.inject(:+)
  end

  def self.from_i(i)
    ip_str = i.to_s(16).rjust(8, "0").scan(/../).map { |s| s.to_i(16).to_s }.join(".")
    return self.new(ip_str)
  end
end

