Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get '/', to: 'welcome#index'
	get '/dog_groomers', to: 'dog_groomers#index'
	get '/dog_groomers/new', to: 'dog_groomers#new'
	post '/dog_groomers', to: 'dog_groomers#create'
end
