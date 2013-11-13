
require 'rest-client'
# require 'json'
require_relative 'person'

puts "Hi there, how old are you?"
old = gets.chomp
new_player = Player.new old

if new_player.age.to_i ==0
	puts "Use numbers, stupid!"
else
	fact = RestClient.get("http://numbersapi.com/#{old}")
	puts fact
	# puts "You're old!"
	# puts "This is fun. Lets' play some more."
	# puts "Tell me what year you born?"
end

# new_object = Baby.new "Spike"
# puts new_object.name => Spike
# puts spike.occupation
# puts spike.diaper_status #=> :needs changing



# class Person
# 	attr_reader :name, :occupation
# 	def initialize name, occupation
# 		@name = name
# 		@occupation = occupation
# 	end
# end

# class Baby < Person
# 	attr_reader :diaper_status
# 	def initialize(name)
# 		super name = "Being a baby"
# 		@diaper_status = :needs_changing

# end

# new_object = Baby.new "Spike"
# puts new_object.name => Spike
# puts spike.occupation
# puts spike.diaper_status #=> :needs changing