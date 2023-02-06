class DogGroomer < ApplicationRecord
	has_many :pets, :dependent => :destroy

	def self.sort
		self.order(:created_at)
	end

	def pet_count
		self.pets.count
	end

	def self.sort_by_amount
		left_joins(:pets).group(:id).order("COUNT(pets.id) DESC")
	end

	def self.find_by_name(name)
		where(name: name)
	end

	def self.find_by_keyword(keyword)
		where("name ILIKE :search OR salon ILIKE :search", search: "%#{keyword}%")
	end
end