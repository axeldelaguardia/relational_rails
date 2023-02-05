require 'rails_helper'

describe DogGroomer do
	it {should have_many :pets}

	describe '#sort_by_creation' do
		it 'sorts dog groomer index by creation date' do
			dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5, created_at: Time.zone.parse("2021-01-01 12:00:00"))
			dog_groomer2 = DogGroomer.create!(name: 'Rachel Green', master_groomer: false, salon: 'PetCo', rating: 3, created_at: Time.zone.parse("2021-01-02 12:00:00"))
			dog_groomer3 = DogGroomer.create!(name: 'Rachel Green', master_groomer: false, salon: 'PetCo', rating: 3, created_at: Time.zone.parse("2021-01-01 12:00:00"))

			expect(DogGroomer.sort).to eq([dog_groomer1, dog_groomer3, dog_groomer2])
		end
	end

	describe '#pet_count' do
		it 'returns the amount of pets for dog groomer' do
			dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5, created_at: Time.zone.parse("2021-01-01 12:00:00"))
			pet1 = dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
			pet2 = dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)

			expect(dog_groomer1.pet_count).to eq(2)
		end
	end

	describe ':sort_by_amount' do
		it 'sorts dog groomers by amount of pets' do
			dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5, created_at: Time.zone.parse("2021-01-01 12:00:00"))
			dog_groomer2 = DogGroomer.create!(name: 'Rita M', master_groomer: true, salon: 'LBD', rating: 5, created_at: Time.zone.parse("2021-01-01 12:00:00"))
			dog_groomer3 = DogGroomer.create!(name: 'Sean', master_groomer: true, salon: 'LBD', rating: 5, created_at: Time.zone.parse("2021-01-01 12:00:00"))
			pet2 = dog_groomer2.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
			pet1 = dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
			pet3 = dog_groomer2.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)

			expect(DogGroomer.sort_by_amount).to eq([dog_groomer2, dog_groomer1, dog_groomer3])
		end
	end
end