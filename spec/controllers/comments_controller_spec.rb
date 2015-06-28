require 'rails_helper'
require "cancan/matchers"
describe CommentsController, type: :controller do
  describe "POST # comments" do
    before do
      @user = User.create(email: "demo@demo.com", password: "12345678")
      @user.confirm
      sign_in @user
      @product = Product.create(name: "bike",description: "cool bycicle",image_url: "bike.jpg",colour: "red",price: "2,99") 
    end
    it "create a new product" do 
      expect{ post :create, { comment: { body: "aaaa" , rating: 4 , user_id: @user.id } , product_id: @product.id } }.to change{Comment.count}.by(1)      
    end
    it "redirect to product" do
      post :create, { comment: { body: "aaaa" , rating: 4 , user_id: @user.id } , product_id: @product.id }
      expect(response).to redirect_to(@product)     
    end
  end
  describe "DELETE # comments" do
    before do
      @user = User.create(email: "demo@demo.com", password: "12345678", admin: false)
      @user.confirm
      sign_in @user
      @product = Product.create(name: "bike",description: "cool bycicle",image_url: "bike.jpg",colour: "red",price: "2,99") 
      @comment = Comment.create(body:"comment's body", rating: 3, product_id: @product.id, user_id: @user.id )
      @ability = Ability.new(@user)
    end
    it "delete a comment" do 
      expect{ delete :destroy,  product_id: @product.id, id: @comment.id }.to change{Comment.count}.by(-1)      
    end

    it "redirect to product" do
      delete :destroy,  product_id: @product.id, id: @comment.id
      expect(response).to redirect_to(@product)     
    end

  end
  describe "cancancan ability" do
    before do
      @user = User.create(email: "demo@demo.com", password: "12345678", admin: false)
      @user.confirm
      sign_in @user
      @product = Product.create(name: "bike",description: "cool bycicle",image_url: "bike.jpg",colour: "red",price: "2,99") 
      @comment = Comment.create(body:"comment's body", rating: 3, product_id: @product.id, user_id: @user.id )

    end
    context "user is not admin" do
      before do
        @ability = Ability.new(@user)
      end
      it "should not have the ability to destroy" do
        expect(@ability).to_not be_able_to(:destroy, @comment)
      end
    end
    context "user is admin" do
      before do
        @user.admin = true
        @ability = Ability.new(@user)
      end
      it "should have the ability to destroy" do
        expect(@ability).to be_able_to(:destroy, @comment)
      end

    end

  end
end
