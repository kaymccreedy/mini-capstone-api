Rails.application.routes.draw do
  
  get "/products", controller: "products", action: "products"

  get "/product_table", controller: "products", action: "product_table"

  get "/one_product", controller: "products", action: "one_product"

  get "/product1", controller: "products", action: "product1"

  get "/product2", controller: "products", action: "product2"

  get "/product3", controller: "products", action: "product3"

  get "/product4", controller: "products", action: "product4"

  get "/product5", controller: "products", action: "product5"

end
