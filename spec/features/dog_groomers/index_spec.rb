require 'rails_helper'

describe 'DogGroomers Index Page' do
	describe 'As a visitor' do
		describe 'when I visit /doggroomers' do
			it 'I see the name of each doggroomer record' do
				dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5)
				dog_groomer2 = DogGroomer.create!(name: 'Rachel Green', master_groomer: false, salon: 'PetCo', rating: 3)
				# dog = doggroomer.pets.create!(name: 'Koa', age: 9, breed: 'mix', weight: 14)

				visit "/dog_groomers"

				expect(page).to have_content(dog_groomer1.name)
				expect(page).to have_content(dog_groomer2.name)
			end
		end

		describe 'I see records are sorted by most recent' do
			dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5)
			dog_groomer2 = DogGroomer.create!(name: 'Rachel Green', master_groomer: false, salon: 'PetCo', rating: 3)

			visit "/dog_groomers"

			expect(page)
		end
	end
end