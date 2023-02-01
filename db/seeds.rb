# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DogGroomer.destroy_all
Pet.destroy_all

groomer1 = DogGroomer.create!( name: 'Groomer 1', master_groomer: true, salon: 'Salon 1', rating: 5 )
groomer2 = DogGroomer.create!( name: 'Groomer 2', master_groomer: true, salon: 'Salon 2', rating: 4 )
groomer3 = DogGroomer.create!( name: 'Groomer 3', master_groomer: true, salon: 'Salon 2', rating: 3 )
groomer4 = DogGroomer.create!( name: 'Groomer 4', master_groomer: false, salon: 'Salon 1', rating: 5 )
pet1 = Pet.create!( dog_groomer: groomer1, name: 'Fido', age: '5', breed: 'Chihuahua', weight: 17 )
pet2 = groomer2.pets.create!( name: 'Spot', age: '13', breed: 'Pitbull', weight: 120 )
pet3 = groomer2.pets.create!( name: 'Koa', age: '13', breed: 'Mix', weight: 17 )
pet4 = groomer1.pets.create!( name: 'Taja', age: '13', breed: 'Mix', weight: 8 )
pet5 = groomer3.pets.create!( name: 'Sushi', age: '13', breed: 'Chihuahua', weight: 34 )
pet6 = groomer3.pets.create!( name: 'Milo', age: '13', breed: 'Labrador', weight: 123 )
pet7 = groomer4.pets.create!( name: 'Buck', age: '13', breed: 'Greyhound', weight: 66 )

# rails db:{drop,create,migrate,seed}