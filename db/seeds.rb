# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create all the cards:
# 2 cards for each value and color
Card.colors.each do |color, index|
  (1..9).each do |value|
    2.times do
      Card.create(
        value: value,
        color: index
      )
    end
  end
end