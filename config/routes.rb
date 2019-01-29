Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	namespace :api do
	     namespace :v1 do
             resources :gifs
             resources :messages
             resources :relationships
             resources :users

             post '/login' => 'sessions#create'
	     end
	end
end


