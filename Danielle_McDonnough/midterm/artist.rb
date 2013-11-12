require_relative 'concert'

class Artist
  def initialize artist
    @artist = artist
  end

  def exists?
    # checks for 404 response
    begin
      search = RestClient.get URI.escape("http://api.bandsintown.com/artists/#{@artist}.json?api_version=2.0&app_id=daniellermcd")
    rescue => e
      r = JSON.parse e.response
      if r.key?("errors")
        false
      else
        true
      end
    end
  end

  def info
    # returns a hash with artist name and number of upcoming concerts
    search = RestClient.get URI.escape("http://api.bandsintown.com/artists/#{@artist}.json?api_version=2.0&app_id=daniellermcd")
    search_parsed = JSON.parse search
    artist_name = search_parsed["name"]
    number_of_upcoming_events = search_parsed["upcoming_events_count"]

    info = { :artist_name => artist_name, :number_of_upcoming_events => number_of_upcoming_events }
  end

  def name
    info[:artist_name]
  end

  def number_of_upcoming_events
    info[:number_of_upcoming_events]
  end

  def concerts
    # returns an array of Concert objects
    events = RestClient.get URI.escape("http://api.bandsintown.com/artists/#{@artist}/events.json?api_version=2.0&app_id=daniellermcd")
    events_parsed = JSON.parse events

    all_concerts = events_parsed.collect do |concert|
      Concert.new title: concert["title"], datetime: concert["formatted_datetime"], location: concert["formatted_location"], venue: concert["venue"]["name"], status: concert["ticket_status"]
    end
  end
end