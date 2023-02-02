require 'rails_helper'

describe DogGroomer do
	it {should have_many :pets}

	describe '#sort_by_creation' do
		it 'sorts dog groomer index by creation date' do
			dog_groomer1 = DogGroomer.create!(name: 'Malia Kainoa', master_groomer: true, salon: 'LBD', rating: 5, created_at: Time.zone.parse("2021-01-01 12:00:00"))
			dog_groomer2 = DogGroomer.create!(name: 'Rachel Green', master_groomer: false, salon: 'PetCo', rating: 3, created_at: Time.zone.parse("2021-01-02 12:00:00"))
			dog_groomer3 = DogGroomer.create!(name: 'Rachel Green', master_groomer: false, salon: 'PetCo', rating: 3, created_at: Time.zone.parse("2021-01-01 12:00:00"))

			expect(DogGroomer.sort).to eq([dog_groomer1, dog_groomer3, dog_groomer2])
		end
	end
end