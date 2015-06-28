require 'rails_helper'

describe OrdersController, type: :controller do 
  describe "POST # orders" do
    before do
      @user = build(:user)
      sign_in @user
    end
    it "create a new order" do 
      expect{ post :create, { order: attributes_for(:order, user_id:@user.id) } }.to change{Order.count}.by(1)      
    end
  end

  describe "DELETE # orders" do
    before do
      @order = create(:order)
      @user = @order.user
      sign_in @user
    end
    it "delete an existing order" do    
      expect{ delete :destroy, id: @order.id }.to change{Order.count}.by(-1)      
    end
  end
  describe "UPDATE # orders" do
    before do
      
      
      @order = create(:order)
      @user = @order.user
      sign_in @user
      put :update, id: @order.id, order: { product_id: 2 }
      @order.reload
    end
    it "update an existing product" do    
      expect( @order.product_id ).to eq(2)    
    end
  end
  describe "GET #index" do
    before do
      @user = build(:user)
      sign_in @user
    end
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
  describe "GET #show" do
    before do
      @order = create(:order) 
      @user = @order.user
      sign_in @user
      
    end
    it "responds successfully with an HTTP 200 status code" do
      get :show, id: @order.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :show, id: @order.id
      expect(response).to render_template("show")
    end
  end
end