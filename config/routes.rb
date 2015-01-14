Rails.application.routes.draw do
  resources :links, only: [:create, :show]

  root "homes#index"
end
