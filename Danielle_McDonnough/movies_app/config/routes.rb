MoviesApp::Application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }
  root "movies#index"
  resources :movies, only: [:index, :show, :new, :create]
  get "search", to: "search#index"
end
