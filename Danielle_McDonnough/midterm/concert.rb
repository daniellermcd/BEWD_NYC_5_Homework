class Concert
  attr_reader :location
  def initialize(title:'', datetime:'', location:'', venue:'', status:'')
    @title = title
    @datetime = datetime
    @location = location
    @venue = venue
    @status = status
  end

  def show
    concert = []
    concert << ''
    concert << '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    concert << "#{@title}"
    concert << '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    concert << "Date: #{@datetime}"
    concert << "City: #{@location}"
    concert << "Venue: #{@venue}"
    concert << "Ticket Status: #{@status.capitalize}"
  end
end