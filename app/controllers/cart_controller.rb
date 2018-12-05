class CartController < ApplicationController

    def additem
        @cart_meals = params[:id]
        @quanti = params[:quant]
        if !set_cart.include?(@cart_meals)
            @semi_order =[@cart_meals,@quanti]
            set_cart.push(@semi_order)
        end

        redirect_to root_path
    end 


    
    private
    def set_cart
        session[:cart] ||= []
    end    
end
