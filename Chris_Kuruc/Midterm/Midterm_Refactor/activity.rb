class Activity
  attr_reader :start_time, :type, :duration, :total_distance, :calories, :climb, :pace

  def initialize parsed 
    @start_time = parsed["start_time"]
    @type = parsed["type"]
    @duration = parsed["duration"]
    @total_distance = parsed["total_distance"]
    @calories = parsed["total_calories"]
    @climb = parsed["climb"]
    @pace = parsed["pace"]
  end

  def formatted
    { start_time: "#{@start_time}",
    type: "#{@type}",
    duration: "#{Time.at(@duration).utc.strftime("%M:%S")}",
    total_distance: "#{(@total_distance / 1609.34).round(2)}",
    calories: "#{calories}",
    climb: "#{(@climb / 0.3048).round(0)}",
    pace: "#{Time.at((@duration) / (@total_distance / 1609.34)).utc.strftime("%M:%S")}" }
  end

end