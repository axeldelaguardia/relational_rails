class DogGroomer < ApplicationRecord
	has_many :pets

	def self.sort
		self.order(:created_at)
	end
end