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
    context "search scope return the correct result" do
      before do 
        @product1 = Product.create(name: "bike",description: "cool bycicle",image_url: "bike.jpg",colour: "red",price: "2,99") 
        @product2 = Product.create(name: "City bike",description: "awesome bycicle",image_url: "bike.jpg",colour: "red",price: "2,99") 
      end
      it "should return the product searched by description" do
        expect(Product.search("cool").to_a[0]).to eq @product1
      end

      it "should return the product searched by name" do
        expect(Product.search("city").to_a[0]).to eq @product2
      end
      it "should return nothing" do
        expect(Product.search("dummy text").to_a).to eq []
      end


    end
  end

  describe "#average_rating" do
    context "when it has comments" do
      before do 
        @product = Product.create(name:"test product") 
        @product.comments.create(body: "cool", rating: 4)
        @product.comments.create(body: "fine", rating: 2)
      end

      it "returns the average rating" do
        expect(@product.average_rating).to eq 3
      end
    end

    context "when no comments" do
      before {@product = Product.new()}
      it "returns nil" do
        expect(@product.average_rating).to eq 0
      end
    end
  end


  