class Concert
  def initialize title:'', datetime:'', location:'', venue:'', status:''
    @title = title
    @datetime = datetime
    @location = location
    @venue = venue
    @status = status
  end

  def to_s
    puts "**** #{@title} ****"
    puts "Date: #{@datetime}"
    puts "City: #{@location}"
    puts "Venue: #{@venue}"
    puts "Ticket Status: #{@status.capitalize}"
    puts
  end
end