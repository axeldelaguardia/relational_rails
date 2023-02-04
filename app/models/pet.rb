class Pet < ApplicationRecord
	belongs_to :dog_groomer

	def self.trained_pets
		Pet.where(trained: true)
	end
end