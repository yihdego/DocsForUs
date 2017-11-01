Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :sessions, only: [:new, :create, :destroy]
  root to: "index#home"
  resources :users, only: [:new, :create, :show] do
    resources :doctors, only: [:create, :destroy]
  end
  resources :doctors, only: [:new, :create, :index, :show] do
    collection do
      get 'find'
    end
  end

  resources :recommendations, only: [:new, :create]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/about' => 'index#about'
  get '/resources' => 'index#about'

  get '/recommendations/add', to: "recommendations#add"
end
