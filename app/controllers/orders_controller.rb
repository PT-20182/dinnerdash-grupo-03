class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  helper_method :create
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    @users = User.all
    flash[:error] = "Entre como administrador para visualizar essas Informações"
    if user_signed_in?
      if current_user.admin == false
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @meal = Meal.find(params[:id])
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
    redirect_to pedidos_path
  
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
    
    @order = Order.find(params[:id])
    if @order.status != params[:status]
      @order.update(status: params[:status])
    end
    redirect_to control_users_index_path
    
  end
  def delete
    @order.destroy
    redirect_to control_users_index_path
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
      params.require(:order).permit(:status)
    end
end
