require 'rails_helper'

RSpec.describe 'DogGroomers Show Page' do
	describe 'As a visitor' do
		describe 'When I visit /dog_groomers/:id' do
			it 'displays the groomer and attributes with that id' do
				dog_groomer1 = DogGroomer.create!({name: 'Alexa Pearson', master_groomer: true, salon: 'PetCo', rating: 5})
				dog_groomer2 = DogGroomer.create!({name: 'John Teal', master_groomer: true, salon: 'PetCo', rating: 5})
				
				visit "/dog_groomers/#{dog_groomer1.id}"
				
				expect(page).to have_content(dog_groomer1.name)
				expect(page).to_not have_content(dog_groomer2.name)
				expect(page).to have_content("Master Groomer: #{dog_groomer1.master_groomer}")
				expect(page).to have_content("Salon: #{dog_groomer1.salon}")
				expect(page).to have_content("Groomer Rating: #{dog_groomer1.rating}")
			end

			it 'Shows a count of of pets associated' do
				dog_groomer1 = DogGroomer.create!({name: 'Alexa Pearson', master_groomer: true, salon: 'PetCo', rating: 5})
				pet1 = dog_groomer1.pets.create!(name: 'Koa', age: 9, breed: 'mix', weight: 14)
				pet2 = dog_groomer1.pets.create!(name: 'Koa', age: 9, breed: 'mix', weight: 14)

				visit "/dog_groomers/#{dog_groomer1.id}"
				save_and_open_page
				expect(page).to have_content("Pets: #{dog_groomer1.pet_count}")
			end
		end
	end
end