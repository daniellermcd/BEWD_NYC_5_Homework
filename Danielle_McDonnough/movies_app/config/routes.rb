MoviesApp::Application.routes.draw do
  devise_for :users
  root "movies#index"
  resources :movies, only: [:index, :show, :new, :create]
  get "search", to: "search#index"
end
