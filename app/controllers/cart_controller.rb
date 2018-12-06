class CartController < ApplicationController

    def additem
        @cart_meals = params[:id]
        @quanti = params[:quant]
        @new_cart_member = {}
        @new_cart_member[:id] = @cart_meals
        @new_cart_member[:number] = @quanti

        @checkBoolean = true
        i=0
        found=0
        set_cart.each do |cart_item|
            if cart_item["id"] == @cart_meals
                @checkBoolean = false
                found=i
            end
            i+=1
        end

        if @checkBoolean == true
            set_cart.push(@new_cart_member)
        else
            b = set_cart[found]["number"].to_i
            b += @quanti.to_i
            set_cart[found]["number"] = b.to_s
        end
        

        redirect_to root_path
    end 

    def removeitem
        @mealId = params[:id]
        @quant = params[:quant]
        i=0
        set_cart.each do |item|
            if item["id"] == @mealId
                if item["number"] == @quant
                    set_cart.delete_if { |h| h["id"] == @mealId}
                else
                    b = set_cart[i]["number"].to_i
                    b -= @quant.to_i
                    set_cart[i]["number"] = b.to_s
                end
            i+=1
            end
        end
        redirect_to root_path
    end
    
    private
    def set_cart
        session[:cart] ||= []
    end    
end
