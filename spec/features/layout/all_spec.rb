require 'rails_helper'

describe 'All Pages' do
	describe 'As a visitor' do
		describe 'When I visit any page' do
			it 'I see a link for the child index' do
				dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5, created_at: Time.zone.parse("2021-01-01 12:00:00"))
				pet = dog_groomer1.pets.create!(name: 'Koa', age: 9, trained: true)

				visit '/dog_groomers'
				expect(page).to have_link('Pet Index', href: '/pets')

				visit "/dog_groomers/#{dog_groomer1.id}"
				expect(page).to have_link('Pet Index', href: '/pets')

				visit "/dog_groomers/#{dog_groomer1.id}/pets"
				expect(page).to have_link('Pet Index', href: '/pets')

				visit "/pets"
				expect(page).to have_link('Pet Index', href: '/pets')

				visit "/pets/#{pet.id}"
				expect(page).to have_link('Pet Index', href: '/pets')
			end
		end
	end
end