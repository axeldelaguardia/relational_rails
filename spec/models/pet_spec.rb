require 'rails_helper'

describe Pet, type: :model do
	it {should belong_to :dog_groomer}

	describe ':trained_pets' do
		it 'shows only pets who have been trained' do
			@dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5)
			@dog1 = @dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
			@dog2 = @dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
			@dog3 = @dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: false)

			expect(Pet.trained_pets).to eq([@dog1, @dog2])
		end
	end
end