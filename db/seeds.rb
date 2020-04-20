# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.create!(title: "My Cool Article",
                link: "https://www.heise.de", description: "some blah")

Article.create!(title: "Another Cool Article",
                link: "https://www.stern.de",
                description: "Enim quis mollit deserunt nisi reprehenderit aliquip. " \
   "Labore mollit duis labore consectetur sunt mollit proident. Esse enim enim id nisi amet magna aliqua sit " \
   "consectetur irure adipisicing magna.")
