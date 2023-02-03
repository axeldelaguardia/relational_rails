require 'rails_helper'

describe 'DogGroomers Index Page' do
	describe 'As a visitor' do
		describe 'when I fill out form with attributes' do
			before do
				visit "/dog_groomers/new"
				fill_in 'name', with: 'New Person'
				choose 'master_groomer', with: 'yes'
				fill_in 'Salon', with: 'Cool Salon'
				choose 'rating', with: '3'
				click_button
			end

			it 'And I click submit button, a new record is created, and takes me to /dog_groomer' do
				expect(page).to have_content('New Person')
			end
		end
	end
end