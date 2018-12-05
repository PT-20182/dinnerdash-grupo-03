class MealCategory < ApplicationRecord
    validates :name, uniqueness: true
end
