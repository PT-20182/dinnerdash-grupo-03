class Meal < ApplicationRecord
    # belongs_to :meal_category

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :description, presence: true
    validates :price, presence: true
end
