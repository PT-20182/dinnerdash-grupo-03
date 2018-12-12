class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  helper_method :create
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    if session[:cart] == []
      redirect_to root_path
    end
    unless user_signed_in?
      redirect_to root_path
    end
    @order = Order.new
    @meals = Meal.all
    @user = current_user
    @userOrders = []
    Order.all.each do |item|
      if item.user_id == current_user.id
        @userOrders << item
      end
    end
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create

    # Conferindo se carrinho está vazio
    @order = Order.new
    totalprice = 0
    # Passando todos os itens salvos no session para OrderMeals e salvando-os
    # Na nova Order a ser criada
    session[:cart].each do |item|
      # Para cada item na session, é criada um nova OrderMeal
      @new_Order_Meal = OrderMeal.new
      @to_add = Meal.all.where(id: item["id"]).take

      # Adicionado os valores necessarios
      @new_Order_Meal.meal_id = @to_add.id
      @new_Order_Meal.order_id = @order
      @new_Order_Meal.quantity = item["number"]

      #Contador para o preço total
      totalprice += item["price"].to_f * item["number"].to_f
      @order.order_meals << @new_Order_Meal

      # Salvando nova OrderMeal
      @new_Order_Meal.save
    end
    # Adicionando valores na order e salvando
    @order.price = totalprice
    @order.user_id = current_user.id
    @order.status = 'pendente'
    @order.save

    # Salvando a order no User
    current_user.orders << @order

    # Clear no carrinho
    session[:cart] = []

    # Redirecinando a view dessa nova order criada
    redirect_to orders_path
  
    #   Scaffold Code:
    # respond_to do |format|
    #   if @order.save
    #     format.html { redirect_to @order, notice: 'Order was successfully created.' }
    #     format.json { render :show, status: :created, location: @order }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:price)
    end
end
