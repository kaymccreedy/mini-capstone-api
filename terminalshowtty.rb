require "http"
require "tty-prompt"
require "tty-table"

prompt = TTY::Prompt.new

response = HTTP.get("http://localhost:3000/product_table").parse
products = []
response.each do |product|
  product_info = []
  product_info << "#{product["name"]}"
  product_info << "#{product["price"]}"
  product_info << "#{product["description"]}"
  products << product_info
end

table = TTY::Table.new(["Item", "Price", "Description"], products)
list = []
table.each do |row|
  list << row[0]
end
list.delete_at(0)
list = list.to_h{ |p| [p, list.index(p)] }


puts "Welcome to the Product Store"
puts "Below is a table of our products:"
puts table.render(:ascii)
choice = prompt.select("Choose a product", list).to_i + 1
p choice
p table[choice]