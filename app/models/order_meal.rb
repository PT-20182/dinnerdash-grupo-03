class OrderMeal < ApplicationRecord
  has_many :meal
  belongs_to :order
end
