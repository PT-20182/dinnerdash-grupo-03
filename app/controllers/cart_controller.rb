class CartController < ApplicationController

    def additem
        @cart_meals = params[:id]
        if !set_cart.include?(@cart_meals)
            set_cart.push(@cart_meals)
        end

        redirect_to root_path
    end 


    
    private
    def set_cart
        session[:cart] ||= []
    end    
end
