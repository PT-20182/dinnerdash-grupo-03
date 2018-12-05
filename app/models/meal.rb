class Meal < ApplicationRecord
    has_one :meal_categories

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :description, presence: true
    validates :price, presence: true
end
