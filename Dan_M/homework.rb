require 'minitest/autorun'
class Person

  def initialize name, profession
    @name=name
    @profession = profession
  end




   def introduce
      "Hi My name is #{@name}.  I'm a #{@profession}"
    end
        def introduce_from_across_the_room
      introduce.upcase
        end




describe Person do
 
 it "is initialized with a name and a profession" do
  Person = Person.new "Steven", "Software Developer"
  Person.introduce.must_equal "Hi My name is Steven.  I'm a Software Developer"
  Person.introduce_from_across_the_room.must_equal "HI MY NAME IS STEVEN.  I'M A SOFTWARE DEVELOPER"
end 
end 
end
#assertsions?  They look bad..Why is line 22 being run before line 2
###homework.rb:22: warning: already initialized constant Person
#homework.rb:2: warning: previous definition of Person was here
