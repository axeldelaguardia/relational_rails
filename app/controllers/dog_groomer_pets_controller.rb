class DogGroomerPetsController < ApplicationController
	def index
		groomer = DogGroomer.find(params[:dog_groomer_id])
		@pets = groomer.pets
	end
end