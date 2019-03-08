Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	namespace :api do
	     namespace :v1 do
             resources :gifs
             resources :messages
             resources :relationships
             resources :users

             get '/potential_relationships' => 'relationships#potential_relationships'
             post '/signup' => 'users#create'
             post '/login' => 'sessions#create'
             post '/logout' => 'sessions#destroy'
	     end
	end

    get '*path', to: "application#fallback_index_html", constraints: ->(request) do
      !request.xhr? && request.format.html?
    end
    
end


