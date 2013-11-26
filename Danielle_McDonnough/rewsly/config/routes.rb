Rewsly::Application.routes.draw do
  root "stories#index"
  get "search", to: "search#index"
  resources :stories, only: [:show]
end
