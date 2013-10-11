require 'spec_helper'

describe Restaurant do
  it { should have_many(:reviews)}

  it 'should give a composite score for the restaurant' do
  	restaurant = Restaurant.create(name: 'Hungries')
  	score1 = Review.create(score: 5)
  	score2 = Review.create(score: 4)
  	restaurant.reviews << score1
  	restaurant.reviews << score2
  	expect(restaurant.composite_score).to eq 4.5
  end
end
