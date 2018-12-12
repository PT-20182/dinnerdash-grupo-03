class MealCategory < ApplicationRecord
    has_many :meals
    validates :name, uniqueness: true

    before_destroy :destroy_meals

    def destroy_meals
        self.meals.each do |meal|
            meal.destroy
        end
    end
end
