require "http"
require "tty-prompt"
require "tty-table"

prompt = TTY::Prompt.new

puts "Welcome to the Product Store"
choice = prompt.select("Choose a page", ["Product Index", "Single Product", "Product Table"])

if choice == "Product Index"
  response = HTTP.get("http://localhost:3000/products").parse
  response.each do |product|
    info = "Item: #{product["name"]} | Price: $#{product["price"]} | Description: #{product["price"]}"
    p info
  end
elsif choice == "Single Product"
  item = prompt.select("")
end
  
# response = HTTP.get("http://localhost:3000/products").parse
# products = []
# response.each do |product|
#   product_info = []
#   product_info << "#{product["name"]}"
#   product_info << "$#{product["price"]}"
#   product_info << "#{product["description"]}"
#   products << product_info
# end

# table = TTY::Table.new(["Item", "Price", "Description"], products)
# list = []
# table.each do |row|
#   list << row[0]
# end
# list.delete_at(0)
# list = list.to_h{ |p| [p, list.index(p)] }

# puts "Below is a table of our products:"
# puts table.render(:ascii)
# choice = prompt.select("Choose a product", list).to_i
# item = products[choice]
# table = TTY::Table[["Item", "Price", "Description"], item]
# puts table.render(:ascii)