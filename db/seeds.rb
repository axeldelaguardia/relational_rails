# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DogGroomer.destroy_all
Pet.destroy_all

groomer1 = DogGroomer.create!( name: 'Rachel Hernandez', master_groomer: true, salon: 'Blue Pooch', rating: 5 )
groomer2 = DogGroomer.create!( name: 'Cassie Davidson', master_groomer: true, salon: 'The Regal Beagle', rating: 4 )
groomer3 = DogGroomer.create!( name: 'Kaitlyn Moore', master_groomer: true, salon: 'Coats and Tails', rating: 3 )
groomer4 = DogGroomer.create!( name: 'Robert Kim', master_groomer: false, salon: 'Coats and Tails', rating: 5 )
pet1 = Pet.create!( dog_groomer: groomer1, name: 'Django', age: '5', weight: 17, trained: true )
pet2 = groomer2.pets.create!( name: 'Spot', age: '13', weight: 120, trained: true)
pet3 = groomer2.pets.create!( name: 'Koa', age: '9', weight: 17, trained: true)
pet4 = groomer1.pets.create!( name: 'Taja', age: '6', weight: 8, trained: false)
pet5 = groomer3.pets.create!( name: 'Sushi', age: '3', weight: 34, trained: true )
pet6 = groomer3.pets.create!( name: 'Milo', age: '14', weight: 123, trained: false )
pet7 = groomer4.pets.create!( name: 'Rupert', age: '1', weight: 66, trained: false )
