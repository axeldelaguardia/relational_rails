# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
groomers = DogGroomer.create([{ name: 'Groomer 1', master_groomer: true, salon: 'Salon 1', rating: 3 }, { name: 'Groomer 2', master_groomer: false, salon: 'Salon 1', rating:4 }])