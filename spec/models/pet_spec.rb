require 'rails_helper'

describe Pet, type: :model do
	it {should belong_to :dog_groomer}

	describe ':trained_pets' do
		it 'shows only pets who have been trained' do
			dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5)
			dog1 = dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
			dog2 = dog_groomer1.pets.create!(name: 'Allen', age: 9, weight: 14, trained: true)
			dog3 = dog_groomer1.pets.create!(name: 'Cookie', age: 9, weight: 14, trained: false)

			expect(Pet.trained_pets).to eq([dog1, dog2])
		end
	end

	describe ':sort_pets' do
		it 'returns pets for dog groomer in alphabetical order' do
			dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5)
			dog1 = dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
			dog2 = dog_groomer1.pets.create!(name: 'Allen', age: 9, weight: 14, trained: true)
			dog3 = dog_groomer1.pets.create!(name: 'Cookie', age: 9, weight: 14, trained: false)

			expect(Pet.sort_pets(dog_groomer1.id)).to eq([dog2, dog3, dog1])
		end
	end

	describe ':pets_of_weight' do
		it 'returns pets for dog groomer of weight higher than specified' do
			dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5)
			dog_groomer2 = DogGroomer.create!(name: 'Scott Kainoa', master_groomer: true, salon: 'LBD', rating: 5)
			dog1 = dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
			dog2 = dog_groomer1.pets.create!(name: 'Allen', age: 9, weight: 36, trained: true)
			dog3 = dog_groomer2.pets.create!(name: 'Cookie', age: 9, weight: 52, trained: false)

			weight = 25

			expect(Pet.of_weight(dog_groomer1.id, weight)).to eq([dog2])
		end
	end

	describe ':find_by' do
		it 'returns pets with columns containing a keyword' do
			dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5)
			dog_groomer2 = DogGroomer.create!(name: 'Scott Kainoa', master_groomer: true, salon: 'LBD', rating: 5)
			dog1 = dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
			dog2 = dog_groomer1.pets.create!(name: 'Allen', age: 9, weight: 36, trained: true)
			dog3 = dog_groomer2.pets.create!(name: 'Cookie', age: 9, weight: 52, trained: false)

			keyword = 'Koa'

			expect(Pet.find_by(keyword)).to eq([dog1])
		end
	end
end