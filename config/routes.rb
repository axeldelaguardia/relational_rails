Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get '/', to: 'welcome#index'
	get '/dog_groomers', to: 'dog_groomers#index'
	get '/dog_groomers/new', to: 'dog_groomers#new'
	post '/dog_groomers', to: 'dog_groomers#create'
	get '/dog_groomers/:id', to: 'dog_groomers#show'
	get '/dog_groomers/:id/edit', to: 'dog_groomers#edit'
	patch '/dog_groomers/:id', to: 'dog_groomers#update'
	delete '/dog_groomers/:id', to: 'dog_groomers#destroy'

	get '/dog_groomers/:id/pets', to: 'dog_groomer_pets#index'
	get '/dog_groomers/:id/pets/new', to: 'dog_groomer_pets#new'
	post '/dog_groomers/:id/pets', to: 'dog_groomer_pets#create'

	get '/pets', to: 'pets#index'
	get '/pets/:id', to: 'pets#show'
	get '/pets/:id/edit', to: 'pets#edit'
	patch '/pets/:id', to: 'pets#update'

end