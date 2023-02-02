class DogGroomer < ApplicationRecord
	has_many :pets

	def self.sort
		self.order(:created_at)
	end

	def pet_count
		self.pets.count
	end
end