require 'rails_helper'

describe 'DogGroomers Index Page' do
	describe 'As a visitor' do
		before do
			@dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5, created_at: Time.zone.parse("2021-01-01 12:00:00"))
			@dog_groomer2 = DogGroomer.create!(name: 'Rachel Green', master_groomer: false, salon: 'PetCo', rating: 3, created_at: Time.zone.parse("2021-01-02 12:00:00"))
			@dog_groomer3 = DogGroomer.create!(name: 'John Tin', master_groomer: false, salon: 'PetCo', rating: 3, created_at: Time.zone.parse("2021-01-01 12:00:00"))

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

			it 'I see a link to update a dog groomer nexet to their info' do
				visit "/dog_groomers"

				expect(page).to have_link("Update", href: "/dog_groomers/#{@dog_groomer1.id}/edit")
				expect(page).to have_link("Update", href: "/dog_groomers/#{@dog_groomer2.id}/edit")
				expect(page).to have_link("Update", href: "/dog_groomers/#{@dog_groomer3.id}/edit")
			end
		end
	end
end