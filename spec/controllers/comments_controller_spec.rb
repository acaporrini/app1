require 'rails_helper'
require "cancan/matchers"
describe CommentsController, type: :controller do
  describe "POST # comments" do
    before do
      @user = build(:user)
      sign_in @user
      @product = create(:product) 
    end
    it "create a new comment" do 
      expect{ post :create, { comment: attributes_for(:comment) , product_id: @product.id } }.to change{Comment.count}.by(1)      
    end
    it "redirect to product" do
      post :create, { comment: attributes_for(:comment) , product_id: @product.id }
      expect(response).to redirect_to(@product)     
    end
  end
  describe "DELETE # comments" do
    before do
      @comment = create(:comment )
      @user = @comment.user
      sign_in @user
      @product = @comment.product
      
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
      @comment = create(:comment )
      @user = @comment.user
      sign_in @user
      
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
