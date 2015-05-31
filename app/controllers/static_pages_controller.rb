class StaticPagesController < ApplicationController
  def landing_page

  end
  def index
    @products = Product.limit(3)
  end
end
