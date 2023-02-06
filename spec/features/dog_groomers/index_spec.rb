require 'rails_helper'

describe 'DogGroomers Index Page' do
	describe 'As a visitor' do
		before do
			@dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5, created_at: Time.zone.parse("2021-01-01 12:00:00"))
			@dog_groomer2 = DogGroomer.create!(name: 'Rachel Green', master_groomer: false, salon: 'PetCo', rating: 3, created_at: Time.zone.parse("2021-01-02 12:00:00"))
			@dog_groomer3 = DogGroomer.create!(name: 'John Tin', master_groomer: false, salon: 'PetCo', rating: 3, created_at: Time.zone.parse("2021-01-01 12:00:00"))
			@pet1 = @dog_groomer2.pets.create!(name: 'Koa', age: 6, weight: 14, trained: true)
			@pet2 = @dog_groomer1.pets.create!(name: 'Taja', age: 13, weight: 7, trained: true)
			@pet3 = @dog_groomer2.pets.create!(name: 'Milo', age: 8, weight: 16, trained: false)
		end

		describe 'when I visit /doggroomers' do
			it 'I see the name of each doggroomer record' do
				visit "/dog_groomers"

				expect(page).to have_content(@dog_groomer1.name)
				expect(page).to have_content(@dog_groomer2.name)
			end

			it 'I see records are sorted by most recent' do
				visit "/dog_groomers"

				expect(@dog_groomer1.name).to appear_before(@dog_groomer3.name)
				expect(@dog_groomer3.name).to appear_before(@dog_groomer2.name)
				expect(page).to have_content("Created At: #{@dog_groomer2.created_at}")
			end

			it 'I see a link to create a new record' do
				visit "/dog_groomers"

				expect(page).to have_link("New Dog Groomer")

				click_on 'New Dog Groomer'

				expect(page).to have_current_path("/dog_groomers/new")
			end

			it 'I see a link to update a dog groomer next to their info' do
				visit "/dog_groomers"

				expect(page).to have_button("Update #{@dog_groomer1.name}")
				expect(page).to have_button("Update #{@dog_groomer2.name}")
				expect(page).to have_button("Update #{@dog_groomer3.name}")
			end

			describe 'delete dog groomer from dog groomers index' do
				it 'I see a link to delete dog groomer, next to each one of them' do
					visit '/dog_groomers'

					expect(page).to have_button("Delete #{@dog_groomer1.name}")
					expect(page).to have_button("Delete #{@dog_groomer2.name}")
					expect(page).to have_button("Delete #{@dog_groomer3.name}")
				end

				it 'when i click on the button, i am returned to updated dog groomers index' do
					visit '/dog_groomers'

					click_button "Delete #{@dog_groomer1.name}"

					expect(page).to_not have_content(@dog_groomer1.name)
				end
			end

			describe 'Sort Dog Groomer by Number of Pets' do
				it 'I see a link to sort parents by number of pets' do
					visit "/dog_groomers"

					expect(page).to have_link("Sort by Number of Pets")
				end

				it 'when i click on the link, I am taken back to index page, where i see them in descending order' do
					visit "/dog_groomers"

					click_on "Sort by Number of Pets"

					expect(@dog_groomer2.name).to appear_before(@dog_groomer1.name)
					expect(@dog_groomer1.name).to appear_before(@dog_groomer3.name)
				end
			end

			describe 'Search by name' do
				it 'I see a text box to filter results by keyword' do
					visit "/dog_groomers"

					expect(page).to have_field(:search_by_name)
					expect(page).to have_button('Sort By Name')
				end

				it 'I get records returned that only contain the name' do
					visit "/dog_groomers"

					fill_in 'search_by_name', with: 'John Tin'
					click_button "Sort By Name"

					expect(page).to have_content('John Tin')
					expect(page).to_not have_content("Malia")
				end
			end
		end
	end
end


# <%= form_with url: "/dog_groomers", method: :get, local: true do |form| %>
# 	<%= form.label :search_by_keyword, "Search by Keyword: " %>
# 	<%= form.text_field :search_by %>
# 	<%= form.submit "Sort By Keyword" %>
# <% end %>