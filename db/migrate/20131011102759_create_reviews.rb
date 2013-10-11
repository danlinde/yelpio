class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :entry
      t.integer :score, :default => 1
      t.timestamps
    end
  end
end
