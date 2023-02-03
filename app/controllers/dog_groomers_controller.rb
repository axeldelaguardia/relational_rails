class DogGroomersController < ApplicationController
	def index
		@groomers = DogGroomer.sort
	end

	def new

	end

	def show
		@groomer = DogGroomer.find(params[:id])
	end

	def create
		groomer = DogGroomer.new({
			name: params[:groomer][:name],
			master_groomer: params[:groomer][:master_groomer],
			salon: params[:groomer][:salon],
			rating: params[:groomer][:rating]
		})

		groomer.save

		redirect_to '/dog_groomers'
	end
end