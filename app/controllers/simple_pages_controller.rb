class SimplePagesController < ApplicationController
  def landing_page
      @products = Product.limit(4)
  end
  def index
  end
end
