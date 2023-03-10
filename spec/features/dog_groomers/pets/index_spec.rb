require 'rails_helper'

describe 'DogGroomer Pets Index' do
	describe 'As a visitor' do
		describe 'When I visit /dog_groomer/:id/pets' do
			before do
				@groomer = DogGroomer.create!(name: 'Alexa Pearson', master_groomer: true, salon: 'LBD', rating: 4)
				@pet1 = @groomer.pets.create!(name: 'Koa', age: 9, weight: 14, trained: true)
				@pet2 = @groomer.pets.create!(name: 'Art', age: 9, weight: 56, trained: true)
			end

			it 'I see each pet associated to groomer' do
				visit "/dog_groomers/#{@groomer.id}/pets"

				expect(page).to have_content(@pet1.name)
				expect(page).to have_content(@pet2.name)
				expect(page).to have_content("Age: #{@pet1.age}")
				expect(page).to have_content("Age: #{@pet2.age}")
				expect(page).to have_content("Weight: #{@pet1.weight}")
				expect(page).to have_content("Weight: #{@pet2.weight}")
				expect(page).to have_content("Trained: #{@pet1.trained}")
				expect(page).to have_content("Trained: #{@pet2.trained}")
			end

			it 'I see a link to add a new pet to specific dog groomer' do
				visit "/dog_groomers/#{@groomer.id}/pets"

				expect(page).to have_link('New Pet', href: "/dog_groomers/#{@groomer.id}/pets/new")
			end

			it 'when I click on link it takes me to new page' do
				visit "/dog_groomers/#{@groomer.id}/pets"

				click_on 'New Pet'

				expect(page).to have_current_path("/dog_groomers/#{@groomer.id}/pets/new")
			end

			it 'I see a link and can click a link to sort pets in alphabetical order' do
				visit "/dog_groomers/#{@groomer.id}/pets"

				expect(page).to have_link('Sort Pets', href: "/dog_groomers/#{@groomer.id}/pets?alpha=true")

				click_on 'Sort Pets'

				expect(@pet2.name).to appear_before(@pet1.name)
			end

			it 'I see a form that allows me to input a number' do
				visit "/dog_groomers/#{@groomer.id}/pets"

				expect(page).to have_field('dog_weight')

				fill_in 'dog_weight', with: '42'
				click_button

				expect(page).to have_content(@pet2.name)
				expect(page).to_not have_content(@pet1.name)
			end
		end
	end
end