class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all.order(:id)
    render template: "suppliers/index"
  end

  def show
    supplier_id = params["id"]
    @supplier = Supplier.find_by(id: supplier_id)
    render template: "suppliers/show"
  end

  def create
    @supplier = Supplier.new(
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"])
    @supplier.save
    if @supplier.save
      render template: "suppliers/show"
    else
      render json: { errors: @supplier.errors.full_messages }, status: 422
    end
  end

  def update
    supplier_id = params["id"]
    @supplier = Supplier.find_by(id: supplier_id)
    @supplier.name = params["name"] || @supplier.name
    @supplier.email = params["email"] || @supplier.email
    @supplier.phone_number = params["phone_number"] || @supplier.phone_number
    @supplier.save
    if @supplier.save
      render template: "suppliers/show"
    else
      render json: { errors: @supplier.errors.full_messages }, status: 422
    end
  end

  def destroy
    supplier_id = params["id"]
    supplier = Supplier.find_by(id: supplier_id)
    supplier.destroy
    render json: {"Success:": "Supplier destroyed"}
  end
  
end