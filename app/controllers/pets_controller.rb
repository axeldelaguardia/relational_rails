class PetsController < ApplicationController
	def index
		@pets = Pet.all
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
end