class Movie < ActiveRecord::Base
   validates :title, :description, presence: true
   validates :description, length: {minimum: 10}
   validates :year_released, numericality: {greater_than: 0}
   validates :rating, inclusion: {in: 1..5, message: "must be between 1 and 5"}
   def self.search_for(query)
      where('title LIKE :query OR description LIKE :query OR year_released LIKE :query', query: "%#{query}%")
   end
end