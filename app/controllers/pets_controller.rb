class PetsController < ApplicationController
	def index
		if params[:search_by] != nil
			@pets = Pet.find_by(params[:search_by])
		else
			@pets = Pet.trained_pets
		end
	end

	def show
		@pet = Pet.find(params[:id])
	end

	def edit
		@pet = Pet.find(params[:id])
	end

	def update
		pet = Pet.find(params[:id])
		pet.update(pets_params)
		pet.save
		redirect_to "/pets/#{pet.id}"
	end

	def destroy
		pet = Pet.find(params[:id])
		pet.destroy
		redirect_to "/pets"
	end

	private
	def pets_params
		params.permit(:name, :age, :weight, :trained)
	end
end