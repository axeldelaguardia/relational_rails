class DogGroomersController < ApplicationController
	def index
		if params[:sort_by_amount] == "true"
			@groomers = DogGroomer.left_joins(:pets).group(:id).order("COUNT(pets.id) DESC")
		elsif params[:search_by_name] != nil
			# require 'pry'; binding.pry
			@groomers = DogGroomer.find_by_name(params[:search_by_name])
		elsif params[:search_by_keyword] != nil
			@groomers = DogGroomer.find_by_keyword(params[:search_by_keyword])
		else
			@groomers = DogGroomer.sort
		end
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

	def edit
		@groomer = DogGroomer.find(params[:id])
	end

	def update
		groomer = DogGroomer.find(params[:id])
		groomer.update({
			name: params[:groomer][:name],
			master_groomer: params[:groomer][:master_groomer],
			salon: params[:groomer][:salon],
			rating: params[:groomer][:rating]
		})

		groomer.save
		redirect_to "/dog_groomers/#{groomer.id}"
	end

	def destroy
		groomer = DogGroomer.find(params[:id])
		groomer.destroy
		redirect_to "/dog_groomers"
	end
end