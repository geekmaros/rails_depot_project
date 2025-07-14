# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.delete_all
# ... Seed Products
Product.create!(
  title: "Learn TS in a weekend",
  description: %(<p><em>Master Type Safety in Record Time</em> with TypeScript mastery — all in just one weekend. This fast-paced, hands-on guide is perfect for JavaScript developers ready to level up with strong typing, better tooling, and more maintainable code. From types and interfaces to real-world projects, you'll learn everything you need to confidently write and understand modern TypeScript by Monday.</p>),
  image_url: "https://images.pexels.com/photos/4238507/pexels-photo-4238507.jpeg",
  price: 25.87
)
#...

