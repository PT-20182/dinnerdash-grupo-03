class Meal < ApplicationRecord
  belongs_to :meal_category
  has_one_attached :image

  validates :name, presence: true
end
