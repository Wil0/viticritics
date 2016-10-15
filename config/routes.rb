Rails.application.routes.draw do

  get 'movies/index'

  resource :movies

  root to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
