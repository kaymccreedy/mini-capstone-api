class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    orders = current_user.orders
    if orders.length > 0
      render template: "orders/index"
    else
      render json: { error: "You have no orders!" }
    end
  end

  def show
    @order = Order.find_by(id: params["id"])
    if @order.user == current_user
      render template: "orders/show"
    else
      render json: { error: "You can only view your own orders" }, status: :unauthorized
    end
  end

  def create
    carted_products = current_user.carted_products.where(status: "carted")
    
    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += ( carted_product.quantity * carted_product.product.price )
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
    
    order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    order.save
    carted_products.update_all(status: "purchased", order_id: order.id)
    render json: order.as_json
  end

end
