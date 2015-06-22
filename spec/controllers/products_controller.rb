require 'rails_helper'

describe ProductsController, :type => :controller do 
  describe "POST # products" do
    before { }
    it "create a new product"do
      post :create, { product: { name: "aaaa" } }
      
    end
  end
end