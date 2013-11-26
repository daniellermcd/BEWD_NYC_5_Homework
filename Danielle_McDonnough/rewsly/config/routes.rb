Rewsly::Application.routes.draw do
  root "stories#index"
  resources :stories, only: [:show]
end
