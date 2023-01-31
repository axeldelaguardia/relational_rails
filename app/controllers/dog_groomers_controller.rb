class DogGroomersController < ApplicationController
	def index
		@groomers = ['1', '2', '3']
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

		DogGroomer.save

		redirect_to '/dog_groomer'
	end
end