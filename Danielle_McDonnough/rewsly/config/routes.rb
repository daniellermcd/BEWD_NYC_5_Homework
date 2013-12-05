Rewsly::Application.routes.draw do
  root "home#index"
  resources :stories, only: [:index, :show, :new, :create]
  get "search", to: "search#index"
end
