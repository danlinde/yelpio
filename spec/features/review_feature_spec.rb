require 'spec_helper'

describe 'the review feature' do
	before(:each) do
		restaurant = Restaurant.create(name: 'Taste Palace')
		visit restaurant_path(restaurant)
		click_link "Add Review"
		fill_in "Review", with: "The food here is good"
	end

	it 'should allow a user to write a review' do
		click_button "Create Review"
		expect(page).to have_content("The food here is good")
	end

	it 'should allow a user to rate his experience on a scale of 1 to 5' do
		fill_in "Score", with: 2
		click_button "Create Review"
		expect(page).to have_content("2")
	end

	it 'should not allow a user to rate his experience higher than 5' do
		fill_in "Score", with: 12
		click_button "Create Review"
		expect(page).to have_content("error")
	end
end