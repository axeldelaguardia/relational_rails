class DogGroomerPetsController < ApplicationController
	def index
		if params[:alpha] == "true"
			@groomer = DogGroomer.find(params[:id])
			@pets = Pet.where(dog_groomer_id: params[:id]).order(:name)
		else
			@groomer = DogGroomer.find(params[:id])
			@pets = @groomer.pets
		end
	end

	def new
		@groomer = DogGroomer.find(params[:id])
	end

	def create
		groomer = DogGroomer.find(params[:dog_groomer_id])
		pet = Pet.new({
			name: params[:name],
			age: params[:age],
			weight: params[:weight],
			trained: params[:trained],
			dog_groomer_id: params[:dog_groomer_id]
		})

		pet.save!
		redirect_to "/dog_groomers/#{groomer.id}/pets"
	end

end