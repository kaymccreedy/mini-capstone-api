class ProductsController < ApplicationController

  def products
    products = Product.all.order(:id)
    productlist = []
    products.each do |product|
      info = "Item: #{product[:name]} | Price: $#{product[:price]} | Description: #{product[:description]}"
      productlist << info
    end
    render json: {"Products:": productlist}
  end

  def product_table
    products = Product.all.order(:id)
    render json: products.as_json
  end

  def one_product
    product = Product.first
    render json: {"Contact Info:": info}
  end

  def product1
    product = Product.first
    render json: {"Contact Info:": info}
  end

  def product2
    product = Product.second
    info = "Item: #{product[:name]} | Price: $#{product[:price]} | Description: #{product[:description]}"
    render json: {"Contact Info:": info}
  end

  def product3
    product = Product.third
    info = "Item: #{product[:name]} | Price: $#{product[:price]} | Description: #{product[:description]}"
    render json: {"Contact Info:": info}
  end

  def product4
    product = Product.fourth
    info = "Item: #{product[:name]} | Price: $#{product[:price]} | Description: #{product[:description]}"
    render json: {"Contact Info:": info}
  end

  def product5
    product = Product.fifth
    info = "Item: #{product[:name]} | Price: $#{product[:price]} | Description: #{product[:description]}"
    render json: {"Contact Info:": info}
  end

end
