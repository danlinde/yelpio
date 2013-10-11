require 'spec_helper'

describe 'Restaurant page' do
	it 'should display restaurants' do
		Restaurant.create(name: 'Taste Palace')
		visit '/restaurants'
		expect(page).to have_content 'Taste Palace'
	end

	it 'should display the restaurant score' do
		pending
		restaurant = Restaurant.create(name: 'Taste Palace')
		score = Review.new(score: 4)
		restaurant.reviews << score
		expect(page).to have_content '4.0'
	end
end

describe 'a new restaurant' do
	before(:each) do
		visit '/restaurants/new'
		fill_in "Name", with: "Taste Palace"
	end

	it 'creates a new restaurant' do
		click_button "Create Restaurant"
		expect(page).to have_content 'Taste Palace'
	end

	it 'adds a description of the restaurant' do
		fill_in "Description", with: "Please come for maximum taste"
		click_button "Create Restaurant"
		click_link 'Taste Palace'
		expect(page).to have_content 'Please come for maximum taste'
	end
end



