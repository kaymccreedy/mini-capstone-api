class ProductsController < ApplicationController

  def index
    @products = Product.all.order(:id)
    render template: "products/index"
  end

  def show
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"])
    @product.save
    render template: "products/show"
  end

  def update
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.description = params["description"] || @product.description
    @product.save
    render template: "products/show"
  end

  def destroy
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.destroy
    render json: {"Success:": "Product destroyed"}
  end
  
end
