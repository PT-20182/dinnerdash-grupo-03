class HomeController < ApplicationController

    def index
        @meals = Meal.all
        @meal_categories = MealCategory.all
    end
end
