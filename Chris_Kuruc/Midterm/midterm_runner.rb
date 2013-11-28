require 'rest-client'
require 'json'
require_relative 'activity_class'

#Data for API access
#Info on creating an app and authenticated token here: http://developer.runkeeper.com/healthgraph/getting-started
base_url = 'https://api.runkeeper.com'
params = { :access_token => ENV['RUNKEEPER_USER_TOKEN'] }

#Get Activity List for RunKeeper User
activities_list = JSON.parse RestClient.get(base_url + '/fitnessActivities', :params => params)
activities_count = activities_list["size"]

#Display the list of activities to the user
puts "Here are your recorded activities from RunKeeper:"

activities_list["items"].each_with_index do |activity, index|
  puts "#{index + 1}: #{activity["type"]} on #{activity["start_time"]}"
end

#Ask the user what activity they want to see more info on
loop do
  puts "Which of your activities would you like to see information on?"
  @activity_selection = gets.chomp.to_i

  if @activity_selection > activities_count || @activity_selection < 1
    puts "That didn't work.  Enter a number between 1 and #{activities_count}."
  else
    break
  end
end

#Based on the user's input, fetch the activity data from the api
activity_data = JSON.parse RestClient.get('https://api.runkeeper.com' + activities_list["items"][@activity_selection - 1]["uri"], :params => params)

#Pass the data off to the activity class to get processed/formatted
my_activity = Activity.new activity_data

#Display details about the activity 
puts "Your #{my_activity.type} activity on #{my_activity.start_time}"
puts "Mileage: #{my_activity.total_distance}"
puts "Duration: #{my_activity.duration}"
puts "Average Pace: #{my_activity.pace}"
puts "Calories Burned: #{my_activity.calories}"
puts "Total Vertical Climb: #{my_activity.climb}"

