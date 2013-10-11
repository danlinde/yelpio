class ReviewsController < ApplicationController
	
	def new
		@review = Review.new
		@restaurant = Restaurant.find params[:restaurant_id]
	end

	def create
		@restaurant = Restaurant.find params[:restaurant_id]
		@review = Review.new(params[:review].permit(:entry, :score, :restaurant_id))
		if @review.save
			redirect_to restaurant_path(@review.restaurant)
		else
			render 'new'
		end
	end
end
