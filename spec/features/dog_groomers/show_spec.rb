require 'rails_helper'

RSpec.describe 'the groomers show page' do
	it 'displays the groomers name' do
		groomer1 = DogGroomer.create!({name: 'Alexa Pearson', master_groomer: true, salon: 'PetCo', rating: 5})
		groomer2 = DogGroomer.create!({name: 'John Teal', master_groomer: true, salon: 'PetCo', rating: 5})
		
		visit "/dog_groomers/#{groomer1.id}"

		expect(page).to have_content(groomer1.name)
		expect(page).to_not have_content(groomer2.name)
	end
end