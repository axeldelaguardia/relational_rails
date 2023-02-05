require 'rails_helper'

describe 'Pets Index Page' do
	describe 'As a visitor' do
		describe 'when I visit /pets' do
			before do
				@dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5)
				@dog1 = @dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
				@dog2 = @dog_groomer1.pets.create!(name: 'Taja', age: 9, weight: 14, trained: true)
				@dog3 = @dog_groomer1.pets.create!(name: 'Chutney', age: 9, weight: 14, trained: false)
			end

			it 'I see the name of each pet record with attributes' do
				visit "/pets"

				expect(page).to have_content(@dog1.name)
				expect(page).to have_content("Age: #{@dog1.age}")
				expect(page).to have_content("Weight: #{@dog1.weight}")
				expect(page).to have_content("Trained: #{@dog1.trained}")
			end

			it 'I only see trained pets' do
				visit '/pets'
				
				expect(page).to have_content(@dog1.name)
				expect(page).to have_content(@dog2.name)
				expect(page).to_not have_content(@dog3.name)
			end

			it 'I see a link to update a dog groomer nexet to their info' do
				visit "/pets"

				expect(page).to have_link("Update", href: "/pets/#{@dog1.id}/edit")
				expect(page).to have_link("Update", href: "/pets/#{@dog2.id}/edit")
			end

			describe 'delete dog groomer from dog groomers index' do
				it 'I see a link to delete dog groomer, next to each one of them' do
					visit '/pets'
					
					expect(page).to have_button("Delete #{@dog1.name}")
					expect(page).to have_button("Delete #{@dog2.name}")
				end

				it 'when i click on the button, i am returned to updated dog groomers index' do
					visit '/pets'

					click_button "Delete #{@dog1.name}"

					expect(page).to_not have_content(@dog_groomer1.name)
				end
			end
		end
	end
end