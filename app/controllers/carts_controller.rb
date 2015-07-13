class CartsController < ApplicationController
  before_action :authenticate_user!
 
  def show

    @items = $redis.hgetall(cart_name)
    @total = $redis.get("total")
  end
 
  def add
    
    $redis.hincrby(cart_name,params[:product_id],1)
    increase_count(1)
    increase_total(params[:product_price])
    respond_to do |format|
      format.js
    end
  end
  def empty
    flush
    redirect_to :back
  end

  def remove
    quantity = $redis.hget(cart_name,params[:product_id])
    price = Product.find(params[:product_id]).price #scope
    $redis.hdel(cart_name,params[:product_id])
    increase_total(-(price.to_f * quantity.to_f))
    increase_count(- quantity.to_i)
    respond_to do |format|
      format.js
    end
  end
  def save
    @order = Order.new(user_id: current_user.id, total: $redis.get("total") )
    $redis.hgetall(cart_name).each do |key,value|
      @product = Product.find(key)
      value.to_i.times {@order.products << @product}
      
    end
    flush #gestione errori
    @order.save
    respond_to do |format|
      format.html { redirect_to @order, notice: 'Order was successfully created.' }
    end
  end
  def count
    count = $redis.get("count") || 0
    respond_to do |format|
      format.json { render json: count }
    end
  end
  private
  def flush
    $redis.del(cart_name)
    $redis.del("total")
    $redis.del("count")
  end
  def cart_name
    "cart_#{current_user.id}"
  end 
  def increase_total(amount)
    
    $redis.incrbyfloat("total", amount.to_f)
  end
  def increase_count(quantity)
    $redis.incrby("count", quantity)    
  end
end
