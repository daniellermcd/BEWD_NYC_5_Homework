require 'geocoder'


 s = Geocoder.coordinates("304 W. 151st Street, New York, NY")

 puts s.first

# s(0)