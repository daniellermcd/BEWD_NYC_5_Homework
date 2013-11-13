class Activity

  def initialize activity_data
    @activity_data = activity_data
  end

  def start_time
    @activity_data["start_time"]
  end

  def type
    @activity_data["type"]
  end

  def duration
    Time.at(@activity_data["duration"]).utc.strftime("%M:%S") + " Minutes"
  end

  def total_distance
    (@activity_data["total_distance"] / 1609.34).round(2)
  end

  def calories
    @activity_data["total_calories"]
  end

  def climb
    (@activity_data["climb"] / 0.3048).round(0).to_s + " Feet"
  end

  def pace
    Time.at((@activity_data["duration"]) / (@activity_data["total_distance"] / 1609.34)).utc.strftime("%M:%S") + " Mins/Mile"
  end

end
