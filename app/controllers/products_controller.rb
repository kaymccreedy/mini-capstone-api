class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    pp current_user
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
      description: params["description"],
      supplier_id: params["supplier_id"]
    )
    @product.save
    if @product.save
      render template: "products/show"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def update
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.description = params["description"] || @product.description
    @product.save
    if @product.save
      render template: "products/show"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.destroy
    render json: {"Success:": "Product destroyed"}
  end
  
end
