class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      orders = current_user.orders
      if current_user && orders.length > 0
        render json: orders.as_json
      elsif current_user && orders.length == 0
        render json: { error: "You have no orders!" }
      end
    else
      render json: { error: "You must be logged in to see orders" }
    end
  end

  def show
    order = Order.find_by(id: params["id"])
    if current_user && order.user == current_user
      order.save
      render json: order.as_json
    elsif current_user && order.user != current_user
      render json: { error: "You can only view your own orders" }, status: :unauthorized
    else
      render json: { error: "You must be logged in to see orders" }
    end
  end

  def create
    if current_user
      product = Product.find_by(id: params["product_id"])
      subtotal = product.price * params["quantity"].to_i
      order = Order.new(
        user_id: current_user.id,
        product_id: product.id,
        quantity: params["quantity"],
        subtotal: subtotal,
        tax: subtotal * 0.09,
        total: subtotal * 1.09
      )
      order.save
      render json: order.as_json
    else
      render json: { error: "You must be logged in to place an order."}, status: :unauthorized
    end
  end

end
