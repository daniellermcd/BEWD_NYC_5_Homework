class Concert
  attr_reader :location
  def initialize title:'', datetime:'', location:'', venue:'', status:''
    @title = title
    @datetime = datetime
    @location = location
    @venue = venue
    @status = status
  end

  def show
    puts "**** #{@title} ****"
    puts "Date: #{@datetime}"
    puts "City: #{@location}"
    puts "Venue: #{@venue}"
    puts "Ticket Status: #{@status.capitalize}"
    puts
  end
end