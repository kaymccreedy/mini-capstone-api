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
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end

end
