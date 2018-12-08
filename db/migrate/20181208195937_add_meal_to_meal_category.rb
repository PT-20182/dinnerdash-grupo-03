class AddMealToMealCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :meal_categories, :meal, foreign_key: true
  end
end
