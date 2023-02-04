require 'rails_helper'

describe 'DogGroomer Pets New' do
	describe 'As a visitor' do
		describe 'When I visit /dog_groomer/:id/pets/new' do
			before do
				@groomer = DogGroomer.create!(name: 'Alexa Pearson', master_groomer: true, salon: 'LBD', rating: 4)
				visit "/dog_groomers/#{@groomer.id}/pets/new"
				fill_in 'name', with: 'New Pet'
				fill_in 'age', with: '6'
				fill_in 'weight', with: '45'
				choose 'trained', with: true
				click_button
			end

			it 'When I fill out the form, it takes me to dog groomer pets index and creates a new pet' do
				expect(page).to have_current_path("/dog_groomers/#{@groomer.id}/pets")
				expect(page).to have_content('New Pet')
			end
		end
	end
end