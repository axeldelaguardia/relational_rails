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
		end
	end
end