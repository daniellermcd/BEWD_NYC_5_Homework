require 'minitest/autorun'

class Person
	attr_accessor :person, :profession
	def initialize person, profession
		@person = person
		@profession = profession

	end


def introduce 
	"Hi! My name is #{@person}. I'm a #{@profession}"
end


def introduce_from_across_the_room
	introduce.upcase
end

end

describe Person do 
  it "is initialized with a name and profession" do
    person = Person.new "Steven", "Software Developer"
    person.introduce.must_equal "Hi! My name is Steven. I'm a Software Developer"
    person.introduce_from_across_the_room.must_equal "HI! MY NAME IS STEVEN. I'M A SOFTWARE DEVELOPER"
  end
end
