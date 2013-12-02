require_relative 'activity_api'

class RunkeeperApp
  attr_reader :stories

  def intro
    get_activities_list
    show_intro
  end

  def start
    ask_for_input
    if @selection < 0 || @selection > (@activities.count - 1)
      show_error
      start
    else
      get_activity
      show_activity
    end
  end

  def get_activities_list
    @activities = ActivitiesList.new
    @activities.get_activities_list
  end

  def show_intro
    puts "Welcome to your RunKeeper Activity Viewer"
    puts "Here are your activities:"
    @activities.activities_list.each_with_index do |activity, index|
      puts "#{index}. #{activity[0]}"
    end
  end

  def ask_for_input
    puts "Enter the number of an activity to see details:"
    @selection = gets.to_i
  end

  def get_activity

    @activity = ActivityDetails.new @activities.get_activity_uri(@selection)
    @activity.get_activity_details
  end

  def show_error
    puts "That didn't work.  Enter a number from 0 to #{@activities.count - 1}."
  end

  def show_activity
    puts "Your #{@activity.activity[:type]} activity on #{@activity.activity[:start_time]}"
    puts "Mileage: #{@activity.activity[:total_distance]} Miles"
    puts "Duration: #{@activity.activity[:duration]} Minutes"
    puts "Average Pace: #{@activity.activity[:pace]} Min/Mile"
    puts "Calories Burned: #{@activity.activity[:calories]}"
    puts "Total Vertical Climb: #{@activity.activity[:climb]} Feet"
  end

end


