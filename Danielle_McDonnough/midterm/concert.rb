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
    concert = [ "**** #{@title} ****", 
                "Date: #{@datetime}", 
                "City: #{@location}", 
                "Venue: #{@venue}", 
                "Ticket Status: #{@status.capitalize}" ]
  end
end