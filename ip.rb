class IP
  attr_reader :octets

  def initialize(ip_str)
    @octets = ip_str.split(".").map(&:to_i)
  end

  def ==(ip)
    self.to_i == ip.to_i
  end

  def +(i)
    IP.from_i(self.to_i + i) if i.is_a?(Integer)
  end

  def &(ip)
    IP.from_octets @octets.zip(ip.octets).map { |a| a.first & a.last }
  end

  def to_s
    @octets.map(&:to_s).join(".")
  end

  def to_i
    @octets.each_with_index.map { |o,i| o*(256**(3-i)) }.inject(:+)
  end

  def self.from_i(i)
    ip_str = i.to_s(16).rjust(8, "0").scan(/../).map { |s| s.to_i(16).to_s }.join(".")
    return IP.new(ip_str)
  end

  def self.from_octets(octets)
    IP.new(octets.map(&:to_s).join("."))
  end
end

