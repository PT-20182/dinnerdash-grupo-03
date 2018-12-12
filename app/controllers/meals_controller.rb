class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
