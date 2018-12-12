class MealCategoriesController < ApplicationController
  def index
    @meal_categories = MealCategory.all
    if current_user.admin == false
      redirect_to root_path
    end
  end

  def show
  end

  def new
    @category = MealCategory.new
  end

  def create
    category = MealCategory.create(cat_params)

    redirect_to meal_categories_path
  end

  def edit
    @category = MealCategory.find(params[:id])
  end
  def update
    @category = MealCategory.find(params[:id])
    @category.update(cat_params)

    redirect_to meal_categories_path
  end

  def destroy
    @category = MealCategory.find(params[:id])
    @category.destroy

    redirect_to meal_categories_path
  end


  private
  def cat_params
    params.require(:meal_category).permit(:name)
  end
end
