PrayApp::Application.routes.draw do
  root :to => "home#index", as: "home"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :posts
end
