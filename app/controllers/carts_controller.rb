class CartsController < ApplicationController
  
  before_action :authenticate_user!, :only => [:checkout]

  def index
  end


  def delete_all
    current_cart.remove_all_products_in_cart
    redirect_to carts_path
  end  

  def delete_item
    product = Product.find(params[:product_id])
    current_cart.remove_product_from_cart(product)
    redirect_to carts_path
  end

  def change_item_quantity
    current_cart.change_cart_item_quantity(params[:product_id] ,params[:count], current_cart.id)
    redirect_to carts_path
  end  

  def checkout  
    #if !current_user
    @order = current_user.orders.build 
    #binding.pry  
    @info = @order.build_info
    #else 
     # redirect_to carts_path
    #end
  end  

  


end
