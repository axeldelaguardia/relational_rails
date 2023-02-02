require 'rails_helper'

describe 'Pets Index Page' do
	describe 'As a visitor' do
		describe 'when I visit /pets' do
			it 'I see the name of each pet record with attributes' do
				dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5)
				dog = dog_groomer1.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)

				visit "/pets"

				expect(page).to have_content(dog.name)
				expect(page).to have_content("Age: #{dog.age}")
				expect(page).to have_content("Weight: #{dog.weight}")
				expect(page).to have_content("Trained: #{dog.trained}")
			end
		end
	end
end