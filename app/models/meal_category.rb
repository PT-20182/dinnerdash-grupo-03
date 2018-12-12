class MealCategory < ApplicationRecord
    validates :name, uniqueness: true
    has_many :meal
end
