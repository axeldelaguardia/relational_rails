require 'rails_helper'

describe 'DogGroomer Pets Index' do
	describe 'As a visitor' do
		describe 'When I visit /dog_groomer/:pet.id/pets' do
			it 'I see each pet associated to groomer' do
				groomer = DogGroomer.create!(name: 'Alexa Pearson', master_groomer: true, salon: 'LBD', rating: 4)
				pet1 = groomer.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
				pet2 = groomer.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)

				visit "/dog_groomers/#{groomer.id}/pets"

				expect(page).to have_content(pet1.name)
				expect(page).to have_content(pet2.name)
				expect(page).to have_content("Age: #{pet1.age}")
				expect(page).to have_content("Age: #{pet2.age}")
				expect(page).to have_content("Weight: #{pet1.weight}")
				expect(page).to have_content("Weight: #{pet2.weight}")
				expect(page).to have_content("Trained: #{pet1.trained}")
				expect(page).to have_content("Trained: #{pet2.trained}")
			end
		end
	end
end