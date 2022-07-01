require "http"
require "tty-prompt"
require "tty-table"

prompt = TTY::Prompt.new
response = HTTP.get("http://localhost:3000/products").parse

items = []
response.each do |product|
  items << "#{product["name"]}"
end

products = []
response.each do |product|
  product_info = []
  product_info << "#{product["name"]}"
  product_info << "$#{product["price"]}"
  product_info << "#{product["description"]}"
  products << product_info
end

table = TTY::Table.new(["Item", "Price", "Description"], products)

puts "Welcome to the Product Store"

while true

  choice = prompt.select("Choose a page", ["Product Index", "Single Product", "Product Table", "Exit"])

  if choice == "Product Index"
    x = 1
    response = HTTP.get("http://localhost:3000/products").parse
    response.each do |product|
      info = "#{x}. Item: #{product["name"]} | Price: $#{product["price"]} | Description: #{product["price"]}"
      puts
      puts info
      x += 1
    end
    puts
    puts

  elsif choice == "Single Product"
    item = prompt.select("Choose a Product", items)
    id = items.index(item) + 79
    response = HTTP.get("http://localhost:3000/products/#{id}").parse
    puts "Item: #{response["name"]}"
    puts "Price: #{response["price"]}"
    puts "Description: #{response["description"]}"
    puts
    puts

  elsif choice == "Product Table" 
    response = HTTP.get("http://localhost:3000/products").parse   
    list = []
    table.each do |row|
      list << row[0]
    end
    list.delete_at(0)
    list = list.to_h{ |p| [p, list.index(p)] }

    puts "Below is a table of our products:"
    puts table.render(:ascii)
    choice = prompt.select("Choose a product", list).to_i
    item = products[choice]
    table = TTY::Table[["Item", "Price", "Description"], item]
    puts table.render(:ascii)
    puts
    puts

  elsif choice == "Exit"
    puts "Bye!"
    break
  end

end