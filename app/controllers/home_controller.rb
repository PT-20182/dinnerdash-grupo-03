class HomeController < ApplicationController

    def index
        @meals = Meal.all
        @meal_categories = MealCategory.all
    end
    def pedidos
        @userOrders = []
        Order.all.each do |item|
            if item.user_id == current_user.id
                @userOrders << item
            end
        end
        @order = Order.where(user_id: current_user.id).last
        @user = current_user
        @meals = Meal.all
    end
end
