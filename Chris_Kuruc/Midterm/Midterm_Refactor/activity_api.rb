require 'rest-client'
require 'json'
require_relative 'activity'


class ActivitiesList
  attr_reader :activities_list

  API_ENDPOINT = 'https://api.runkeeper.com'
  API_PARAMS = { :access_token => ENV['RUNKEEPER_USER_TOKEN'] } # E-mail me if you want a token to test with

  def get_activities_list
    parsed = JSON.parse RestClient.get(API_ENDPOINT + '/fitnessActivities', :params => API_PARAMS)

    @activities_list = parsed["items"].collect do |activity|
       [ "#{activity["type"]} on #{activity["start_time"]}", activity["uri"] ]
    end
  end

  def get_activity_uri selection
    @activities_list[selection][1]
  end

  def count
    @activities_list.count
  end

end


class ActivityDetails
  attr_reader :activity

  API_ENDPOINT = 'https://api.runkeeper.com'
  API_PARAMS = { :access_token => ENV['RUNKEEPER_USER_TOKEN'] }

  def initialize uri
    @uri = uri
  end

  def get_activity_details
    activity_details = Activity.new JSON.parse RestClient.get(API_ENDPOINT + @uri, :params => API_PARAMS)
    @activity = activity_details.formatted
  end

end

