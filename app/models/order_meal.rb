class OrderMeal < ApplicationRecord
  has_many :meal
  belongs_to :order


  validates :name, presence: true

end
