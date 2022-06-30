# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.new( name: "surgical mask", price: 1, image_url: "https://m.media-amazon.com/images/I/61+ilDgVVwS._UL1500_.jpg", description: "standard blue surgical mask, 1 ct.")

Product.new( name: "Lysol wipes", price: 10, image_url: "https://www.lysol.com/content/dam/commerce/lysol-us/us/en/2553253d5ea1030450323f65f11bf6447967e5cc/_jcr_content/renditions/original", description: "Lysol disinfectant wipes, 80 ct.")

Product.new( name: "hand sanitizer", price: 5, image_url: "https://i5.walmartimages.com/asr/5aaecbe5-192e-4056-b47d-72b6def0a6db_1.b9f9aea239328af4271c3a68aad9ed2d.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF", description: "Equate moisturizing hand sanitizer, 34 fl oz")

Product.new( name: "face shield", price: 5, image_url: "https://cdn.webshopapp.com/shops/15250/files/342348300/protection-face-shield-with-glasses-frame.jpg", description: "protective face shield")

Product.new( name: "disposable gloves", price: 10, image_url: "https://www.carolina.com/images/product/large/706335_w.jpg", description: "disposable nitrile gloves, 100 ct.")