Rails.application.routes.draw do
  # get 'drawings/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'drawings#index'

  post '/change_color', to: 'drawings#change_color', as: :change_color

  # Defines the root path route ("/")
  # root "articles#index"
end
