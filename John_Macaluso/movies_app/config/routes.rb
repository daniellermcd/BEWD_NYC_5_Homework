MoviesApp::Application.routes.draw do
  root "movies#index"
  resources :movies, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  get "search", to: "search#index"
end
