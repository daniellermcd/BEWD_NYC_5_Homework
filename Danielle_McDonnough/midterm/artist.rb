require_relative 'concert'
require 'rest-client'
require 'json'
require 'uri'

class Artist
  def initialize artist
    @artist = artist
  end

  def info
    errors = {}
    begin
      search = RestClient.get URI.escape("http://api.bandsintown.com/artists/#{@artist}.json?api_version=2.0&app_id=daniellermcd")
    rescue => e
      r = JSON.parse e.response
      if r.key?("errors")
        errors = r
      end
    end

    if errors.empty?
      search_parsed = JSON.parse search
      { :artist_name           => search_parsed["name"], 
        :upcoming_events_count => search_parsed["upcoming_events_count"], 
      }
    else
      errors["errors"]
    end
  end

  def name
    info[:artist_name]
  end

  def upcoming_events_count
    info[:upcoming_events_count]
  end

  def all_concerts
    # returns an array of Concert objects
    events = RestClient.get URI.escape("http://api.bandsintown.com/artists/#{@artist}/events.json?api_version=2.0&app_id=daniellermcd")
    events_parsed = JSON.parse events

    events_parsed.collect do |concert|
      Concert.new title: concert["title"], datetime: concert["formatted_datetime"], location: concert["formatted_location"], venue: concert["venue"]["name"], status: concert["ticket_status"]
    end
  end

  def recommended location, radius
    # checks for errors with location and radius
    errors = {}
    begin
      recommended = RestClient.get URI.escape("http://api.bandsintown.com/artists/#{@artist}/events/recommended?location=#{location}&radius=#{radius}&app_id=daniellermcd&api_version=2.0&format=json")
    rescue => e
      r = JSON.parse e.response
      if r.key?("errors")
        errors = r
      end
    end

    if errors.empty?
      # returns an array of Concert objects
      recommended_parsed = JSON.parse recommended
      recommended_parsed.collect do |concert|
        Concert.new title: concert["title"], datetime: concert["formatted_datetime"], location: concert["formatted_location"], venue: concert["venue"]["name"], status: concert["ticket_status"]
      end
    else
      errors["errors"]
    end
  end
end