class CartController < ApplicationController

    def additem
        # Pegando os parametros passados
        @cart_meals = params[:id]
        @quanti = params[:quant]
        @Price = params[:price]

        # Criando um dicionario com os valores recebidos
        @new_cart_member = {}
        @new_cart_member[:id] = @cart_meals
        @new_cart_member[:number] = @quanti
        @new_cart_member[:price] = @Price.to_f

        # Verificando se o item já existe no carrinho
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

        # Se não existir, adiciona ao carrinho
        # Se já existir Só atualiza a quantidade
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
