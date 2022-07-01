class ProductsController < ApplicationController

  def index
    products = Product.all.order(:id)
    render json: products.as_json
  end

  def show
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end

  def create
    product = Product.new(name: "small hand sanitizer", price: 2, image_url: "https://m.media-amazon.com/images/I/61vXGLpOiPL._SL1500_.jpg", description: "small bottle of hand sanitizer")
    product.save
    render json: product.as_json
  end

end
