class Pet < ApplicationRecord
	belongs_to :dog_groomer

	def self.trained_pets
		Pet.where(trained: true)
	end

	def self.sort_pets(dog_groomer_id)
		Pet.where(dog_groomer_id: dog_groomer_id).order(:name).to_a
	end

	def self.of_weight(dog_groomer_id, weight)
		Pet.where(dog_groomer_id: dog_groomer_id).where("weight > #{weight}")
	end
end