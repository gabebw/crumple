Rails.application.routes.draw do
  resources :links, only: [:create, :show]
  root "homes#index"

  get "/u/:id" => "redirects#show", as: :redirect
end
