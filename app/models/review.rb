class Review < ActiveRecord::Base
	belongs_to :restaurant

	validates :score, inclusion: { in: 1..5, message: "%{value} is not a valid score" }
end
