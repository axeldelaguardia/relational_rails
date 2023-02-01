class DogGroomersController < ApplicationController
	def index
		@groomers = DogGroomer.all
	end

	def new

	end

	def create
		groomer = DogGroomer.new({
			name: params[:groomer][:name],
			master_groomer: params[:groomer][:master_groomer],
			salon: params[:groomer][:salon],
			rating: params[:groomer][:rating]
		})

		groomer.save

		redirect_to '/dog_groomer'
	end

	def show
		@groomer = DogGroomer.find(params[:id])
	end
end