class Order < ApplicationRecord
    has_many :ordelMeal
    belongs_to :user
end
