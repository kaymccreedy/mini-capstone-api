Rails.application.routes.draw do
  
  get "/products", controller: "products", action: "products"

  get "/product_table", controller: "products", action: "product_table"

  get "/one_product/:id", controller: "products", action: "one_product"

end
