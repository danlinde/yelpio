class Restaurant < ActiveRecord::Base
	has_many :reviews

	def composite_score
		reviews.average(:score)
	end
end
