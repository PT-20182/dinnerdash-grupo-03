class MealCategoriesController < ApplicationController
  before_action :set_meal_category, only: [:show, :edit, :update, :destroy]

  # GET /meal_categories
  # GET /meal_categories.json
  def index
    @meal_categories = MealCategory.all
  end

  # GET /meal_categories/1
  # GET /meal_categories/1.json
  def show
  end

  # GET /meal_categories/new
  def new
    @meal_category = MealCategory.new
  end

  # GET /meal_categories/1/edit
  def edit
  end

  # POST /meal_categories
  # POST /meal_categories.json
  def create
    @meal_category = MealCategory.new(meal_category_params)

    respond_to do |format|
      if @meal_category.save
        format.html { redirect_to @meal_category, notice: 'Meal category was successfully created.' }
        format.json { render :show, status: :created, location: @meal_category }
      else
        format.html { render :new }
        format.json { render json: @meal_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_categories/1
  # PATCH/PUT /meal_categories/1.json
  def update
    respond_to do |format|
      if @meal_category.update(meal_category_params)
        format.html { redirect_to @meal_category, notice: 'Meal category was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal_category }
      else
        format.html { render :edit }
        format.json { render json: @meal_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_categories/1
  # DELETE /meal_categories/1.json
  def destroy
    @meal_category.destroy
    respond_to do |format|
      format.html { redirect_to meal_categories_url, notice: 'Meal category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_category
      @meal_category = MealCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_category_params
      params.require(:meal_category).permit(:name)
    end
end
