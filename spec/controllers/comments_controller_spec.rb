require 'rails_helper'

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
      @user = User.create(email: "demo@demo.com", password: "12345678")
      @user.confirm
      sign_in @user
      @product = Product.create(name: "bike",description: "cool bycicle",image_url: "bike.jpg",colour: "red",price: "2,99") 
      @comment = Comment.create(body:"comment's body", rating: 3, product_id: @product.id, user_id: @user.id )
    end
    it "delete a comment" do 
      expect{ delete :destroy,  product_id: @product.id, id: @comment.id }.to change{Comment.count}.by(-1)      
    end
    it "redirect to product" do
      delete :destroy,  product_id: @product.id, id: @comment.id
      expect(response).to redirect_to(@product)     
    end

  end
end
