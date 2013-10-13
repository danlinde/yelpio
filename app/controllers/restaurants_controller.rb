class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find params[:id]
		@review = Review.new

	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.create(params[:restaurant].permit(:name, :description))
		redirect_to restaurants_path
	end

	def destroy
		restaurant = Restaurant.find(params[:id]).destroy
		redirect_to restaurants_path
	end
end
