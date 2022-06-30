class ProductsController < ApplicationController

  def products
    products = Product.all.order(:id)
    productlist = []
    products.each do |product|
      info = "Item: #{product[:name]} | Price: #{product[:price]} | Description: #{product[:description]}"
      productlist << info
    end
    render json: {"Products:": productlist}
  end

  def contact1
    contact = Contact.first
    info = "First name: #{contact[:first_name]} | Last name: #{contact[:last_name]} | Email: #{contact[:email]} | Phone number: #{contact[:phone_number]}"
    render json: {"Contact Info:": info}
  end

end
