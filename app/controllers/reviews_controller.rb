class ReviewsController < ApplicationController
	
	def new
		@review = Review.new
		@restaurant = Restaurant.find params[:restaurant_id]
	end

	def create
		@restaurant = Restaurant.find params[:restaurant_id]
		@review = Review.new(params[:review].permit(:entry, :score, :restaurant_id))

		respond_to do |format|	
			if @review.save
				format.html { redirect_to restaurant_path(@review.restaurant), notice: 'Review was successully created.' }
				format.js   {}
      			format.json { render json: @restaurant, status: :created, location: @restaurant }
			else
				format.html {render 'new'}
				format.json { render json: @restaurant.errors, status: :unprocessable_entity }
			end
		end
	end
end
