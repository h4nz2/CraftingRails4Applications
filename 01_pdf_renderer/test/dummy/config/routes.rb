Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/home", to: "home#index", as: :home

  get "/another", to: "home#another", as: :another
end
