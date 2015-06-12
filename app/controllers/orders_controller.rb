class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  def index
    @orders=Order.includes(:product , :user ).all
  end
  def show

    # @user = User.find(@order.user_id)
    # @product = Product.find(@order.product_id)
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
  def edit

  end
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
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
    @order = Order.includes(:product , :user ).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:user_id, :product_id)
  end
end