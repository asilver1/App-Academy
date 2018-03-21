Rails.application.routes.draw do
  routes :users, only: [:create, :new]
  routes :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end