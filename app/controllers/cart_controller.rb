class CartController < ApplicationController

    def additem
        @cart_meals = params[:id]
        @quanti = params[:quant]
        @new_cart_member = {}
        @new_cart_member[:id] = @cart_meals
        @new_cart_member[:number] = @quanti

        @checkBoolean = true

        set_cart.each do |cart_item|
            if cart_item["id"] == @cart_meals
                @checkBoolean = false
            end
        end

        if @checkBoolean == true
            set_cart.push(@new_cart_member)
        end

        redirect_to root_path
    end 


    
    private
    def set_cart
        session[:cart] ||= []
    end    
end
