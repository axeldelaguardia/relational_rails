require 'rails_helper'

describe 'Pets Edit Page' do
	describe 'As a visitor' do
		describe 'when I am taken to edit page' do
			before do
				@dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5)
				@dog = @dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)

				visit "/pets/#{@dog.id}/edit"

				fill_in 'name', with: 'New Pet'
				fill_in 'age', with: '6'
				fill_in 'weight', with: '45'
				choose 'trained', with: false
				click_button
			end

			describe 'when I fill out the form' do
				it 'And I click submit button, a new record is created, and takes me to /pets' do
					expect(page).to have_current_path("/pets/#{@dog.id}")
					
					expect(page).to have_content('New Pet')
					expect(page).to have_content('Age: 6')
					expect(page).to have_content('Weight: 45')
					expect(page).to have_content('Trained: false')
				end
			end
		end
	end
end