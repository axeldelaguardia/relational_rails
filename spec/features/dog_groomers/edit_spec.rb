require 'rails_helper'

describe 'DogGroomers Edit Page' do
	describe 'As a visitor' do
		describe 'when I am taken to edit page' do
			before do
				@dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5, created_at: Time.zone.parse("2021-01-01 12:00:00"))

				visit "/dog_groomers/#{@dog_groomer1.id}/edit"
				fill_in 'name', with: 'Edit Groomer'
				choose 'master_groomer', with: 'yes'
				fill_in 'Salon', with: 'Cool Salon'
				choose 'rating', with: '3'
				click_button
			end

			describe 'when I fill out the form' do
				it 'And I click submit button, a new record is created, and takes me to /dog_groomer' do
					expect(page).to have_current_path("/dog_groomers/#{@dog_groomer1.id}")
					expect(page).to have_content('Edit Groomer')
				end
			end
		end
	end
end