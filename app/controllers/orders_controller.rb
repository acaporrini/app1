class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]
  load_and_authorize_resource
  def index
    @orders=Order.includes(:user, :products).by_user(current_user.id)
    #.where(user_id: current_user.id)
  end
  def show
    @products = {}
    @order.products.each do |product|
      if @products[product]
        @products[product] = @products[product] + 1
      else
        @products[product] = 1
      end  
    end

  end
  def new
    @order=Order.new
  end
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
        format.json { render :index, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.includes(:products , :user ).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:user_id, :product_id)
  end
end