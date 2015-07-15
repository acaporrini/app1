class CartsController < ApplicationController
  before_action :authenticate_user!
 
  def show
    @items = $redis.hgetall(cart_name)
    @products = Product.find(@items.keys)
    @total = $redis.get("total_#{cart_name}")
  end
 
  def add
    
    $redis.hincrby(cart_name,params[:product_id],1)
    $redis.expire(cart_name,172800)
    increase_count(1)
    increase_total(params[:product_price])
    respond_to do |format|
      format.js
    end
  end
  def empty
    empty_cart
    redirect_to :back
  end

  def remove
    quantity = $redis.hget(cart_name,params[:product_id])
    price = Product.find(params[:product_id]).price
    $redis.hdel(cart_name,params[:product_id])
    increase_total(-(price.to_f * quantity.to_f))
    increase_count(- quantity.to_i)
    respond_to do|format|
      format.json { render json: {status: "ok", message: "Success!", id: params[:product_id] }}
    end
  end
  def save
    @order = Order.new(user_id: current_user.id, total: $redis.get("total_#{cart_name}") )
    $redis.hgetall(cart_name).each do |key,value|
      @product = Product.find(key)
      value.to_i.times {@order.products << @product}    
    end
    empty_cart 
    @order.save
    respond_to do |format|
      format.html { redirect_to @order, notice: 'Order was successfully created.' }
    end
  end
  def count
    count = $redis.get("count_#{cart_name}") || 0
    respond_to do |format|
      format.json { render json: count }
    end
  end
  def total
    total = $redis.get("total_#{cart_name}")
    respond_to do |format|
      format.json { render json: total }
    end
  end
  private

  def empty_cart
    $redis.del(cart_name)
    $redis.del("total_#{cart_name}")
    $redis.del("count_#{cart_name}")
  end
  def cart_name
    "cart_#{current_user.id}"
  end 
  def increase_total(amount)
    $redis.incrbyfloat("total_#{cart_name}", amount.to_f)
    $redis.expire("total_#{cart_name}",172800)
  end
  def increase_count(quantity)
    $redis.incrby("count_#{cart_name}", quantity) 
    $redis.expire("count_#{cart_name}",172800)   
  end
end
