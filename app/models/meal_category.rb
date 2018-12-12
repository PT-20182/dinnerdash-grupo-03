class MealCategory < ApplicationRecord
    has_many :meals
    validates :name, uniqueness: true
end
