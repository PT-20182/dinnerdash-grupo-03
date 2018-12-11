class Order < ApplicationRecord
    has_many :order_meals
    belongs_to :user


    before_destroy :delete_OrderMeals
    
    def delete_OrderMeals
        self.order_meals.each do |item|
            item.destroy
        end
    end
end
