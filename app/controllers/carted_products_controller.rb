class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    carted_products = CartedProduct.all
    render json: carted_products.as_json
  end

  def show
    carted_product = CartedProduct.find_by(id: params["id"])
    render json: carted_product.as_json
  end

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      order_id: nil,
      product_id: params["product_id"],
      quantity: params["quantity"],
      status: "carted",
    )
    carted_product.save
    render json: carted_product.as_json
  end

  def update
    carted_product = CartedProduct.find_by(id: params["id"])
    carted_product.quantity = params["quantity"] || carted_product.quantity
    render json: carted_product.as_json
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params["id"])
    carted_product.status = "removed"
    render json: carted_product.as_json
  end

end
