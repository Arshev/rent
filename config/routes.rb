Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: { confirmations: 'confirmations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
  resources :cars, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'preload'
    end
    resources :photos, only: [:create, :destroy]
    resources :reservations, only: [:create]
  end
  resources :quick_bookings, only: [:create]
  resources :bookings, only: [:create, :show, :index, :new] do
    resources :documents, only: [:create]
  end
  resources :reviews, only: [:create, :index, :destroy, :approve] do
    member do
      post '/approve' => "reviews#approve"
    end
  end
  resources :prices, only: [:index]
  resources :contacts, only: [:index, :create]
  resources :terms, only: [:index]
  resources :faqs, only: [:index]
  resources :abouts, only: [:index]
end
