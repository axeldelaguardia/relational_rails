require 'rails_helper'

describe 'Pets Show Page' do
	describe 'As a visitor' do
		describe 'when I visit /pets/:id' do
			before do
				@dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5)
				@dog = @dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
			end

			it 'I see the name of pet with id including attributes' do
				visit "/pets/#{@dog.id}"

				expect(page).to have_content(@dog.name)
				expect(page).to have_content("Age: #{@dog.age}")
				expect(page).to have_content("Weight: #{@dog.weight}")
				expect(page).to have_content("Trained: #{@dog.trained}")
			end

			it 'I see a link to update the pet' do
				visit "/pets/#{@dog.id}"
				
				expect(page).to have_button("Update #{@dog.name}")
			end

			it 'when I click the button it takes me to that page' do
				visit "/pets/#{@dog.id}"
				click_button "Update #{@dog.name}"

				expect(current_path).to eq("/pets/#{@dog.id}/edit")
			end

			describe 'delete button' do
				it 'has a button to delete pet record' do
					visit "/pets/#{@dog.id}"

					expect(page).to have_content(@dog.name)

					click_button "Delete #{@dog.name}"

					expect(current_path).to eq("/pets")
					expect(page).to_not have_content(@dog.name)
				end
			end
		end
	end
end