class DogGroomerPetsController < ApplicationController
	def index
		@groomer = DogGroomer.find(params[:id])
		@pets = @groomer.pets
	end
end