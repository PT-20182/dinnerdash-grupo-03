class OrdelMeal < ApplicationRecord
  has_one :meal
  belongs_to :order
end
