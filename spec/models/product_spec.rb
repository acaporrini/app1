require 'rails_helper'

  describe Product do
    context "Should return his attributes" do
      before { @product = Product.new(name: "bike",description: "cool bike",image_url: "bike.jpg",colour: "red",price: "2,99") }
      it "Should return the name" do
        expect(@product.name).to eq "bike"
      end
      it "Should return the description" do
        expect(@product.description).to eq "cool bike"
      end
      it "Should return the image url" do
        expect(@product.image_url).to eq "bike.jpg"
      end
      it "Should return the color" do
        expect(@product.colour).to eq "red"
      end
    end
  end