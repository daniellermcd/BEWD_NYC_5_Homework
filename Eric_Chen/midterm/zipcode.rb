class Zipcode
  def initialize zipcode
    @zipcode = zipcode
  end

  def valid?
    @zipcode.match('^\d{5}') != nil
  end

  def to_s
    @zipcode
  end
end  