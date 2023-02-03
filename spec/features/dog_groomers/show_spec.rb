require 'rails_helper'

RSpec.describe 'DogGroomers Show Page' do
	describe 'As a visitor' do
		describe 'When I visit /dog_groomers/:id' do

			before do
				@dog_groomer1 = DogGroomer.create!({name: 'Alexa Pearson', master_groomer: true, salon: 'PetCo', rating: 5})
				@dog_groomer2 = DogGroomer.create!({name: 'John Teal', master_groomer: true, salon: 'PetCo', rating: 5})
				@pet1 = @dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
				@pet2 = @dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
			end

			it 'displays the groomer and attributes with that id' do
				visit "/dog_groomers/#{@dog_groomer1.id}"
				
				expect(page).to have_content(@dog_groomer1.name)
				expect(page).to_not have_content(@dog_groomer2.name)
				expect(page).to have_content("Master Groomer: #{@dog_groomer1.master_groomer}")
				expect(page).to have_content("Salon: #{@dog_groomer1.salon}")
				expect(page).to have_content("Groomer Rating: #{@dog_groomer1.rating}")
			end

			it 'Shows a count of of pets associated' do
				visit "/dog_groomers/#{@dog_groomer1.id}"

				expect(page).to have_content("Pets: #{@dog_groomer1.pet_count}")
			end

			it 'I see a link to take me to the pets table' do
				visit "/dog_groomers/#{@dog_groomer1.id}"

				expect(page).to have_link("All #{@dog_groomer1.name} Pets", href: "/dog_groomers/#{@dog_groomer1.id}/pets")
			end

			describe 'Dog Groomer Update' do
				it 'I see a link to update to update a dog groomer and can click on it' do
					visit "/dog_groomers/#{@dog_groomer1.id}"

					expect(page).to have_link('Update Dog Groomer', href: "/dog_groomers/#{@dog_groomer1.id}/edit")
				end

				it 'When I click link, it takes me to update page' do
					visit "/dog_groomers/#{@dog_groomer1.id}"

					click 
				end
			end
		end
	end
end