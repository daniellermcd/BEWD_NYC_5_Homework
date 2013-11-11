class Concert
  def initialize title, formatted_datetime, formatted_location, venue_name, ticket_status
    @title = title
    @formatted_datetime = formatted_datetime
    @formatted_location = formatted_location
    @venue_name = venue_name
    @ticket_status = ticket_status
  end

  def to_s
    puts "**** #{@title} ****"
    puts "Date: #{@formatted_datetime}"
    puts "City: #{@formatted_location}"
    puts "Venue: #{@venue_name}"
    puts "Ticket Status: #{@ticket_status.capitalize}"
    puts
  end
end