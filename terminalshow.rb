require "http"

system "clear"
puts "Welcome to Mini-Products-API"
while true
  puts "Enter a number to navigate to a page"
  puts "[0] All Products\n[1] First Product\n[2] Second Product\n[3] Third Product\n[4] Fourth Product\n\n[5] Fifth Product\n\n[6] Exit\n\n"
  number = gets.chomp.to_i
  if number == 0
    page = "products"
  elsif number.between?(1,5)
    page = "product" + number.to_s
  elsif number == 6
    puts "Bye bye!"
    break
  else
    puts "\n\nError! Page does not exist!\n\n"
  end

  response = HTTP.get("http://localhost:3000/#{page}")
  products = response.parse
  puts
  products.each do |product|
    puts product
  end
  puts
end
