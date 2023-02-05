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
		pet.update({
			name: params[:name],
			age: params[:age],
			weight: params[:weight],
			trained: params[:trained]
		})

		pet.save

		redirect_to "/pets/#{pet.id}"
	end

	def destroy
		pet = Pet.find(params[:id])
		pet.destroy
		redirect_to "/pets"
	end
end