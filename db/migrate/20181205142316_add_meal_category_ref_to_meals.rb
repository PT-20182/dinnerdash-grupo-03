class AddMealCategoryRefToMeals < ActiveRecord::Migration[5.2]
  def change
    add_reference :meals, :meal_categories, foreign_key: true
  end
end
