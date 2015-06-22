require 'rails_helper'

describe ProductsController, type: :controller do 
  describe "POST # products" do
    before do
      @user = User.create(email: "demo@demo.com", password: "12345678")
      @user.confirm
      sign_in @user
    end
    it "create a new product" do
      
      expect{ post :create, { product: { name: "aaaa" } } }.to change{Product.count}.by(1)
      
    end
  end
end