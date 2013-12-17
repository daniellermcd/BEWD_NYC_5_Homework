require "RestClient"
require "JSON"

class GoogleDistance
  attr_reader :parsed

  def initialize parsed
    @parsed = parsed
  end

  def origin_address
    @parsed["origin_addresses"].first
  end

  def destination_address
    @parsed["destination_addresses"].first
  end

  def distance
    @parsed["rows"].first["elements"].first["distance"]["text"]
  end

  def self.find_by_zip origin, destination
    result = RestClient.get("http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{origin}&destinations=#{destination}&sensor=false")
    GoogleDistance.new(JSON.parse(result))
  end

end
