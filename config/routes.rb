Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: { confirmations: 'confirmations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :cars
      resources :booking, only: [:create]
    end
  end

  resources :users, only: [:show]
  resource :text
  resource :admin, except: [:edit, :new, :create] do
    member do
      get 'cars'
      get 'new_car'
      get 'upload_photos'
      get 'edit_car'
      get 'text_main'
      get 'text_other'
      get 'text_metatags'
    end
  end

  resources :cars, except: [:edit] do
    resources :photos, only: [:create, :destroy] do
      member do
        patch :toggle_main_photo
      end
    end
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
  resources :prices
  resources :contacts, only: [:index, :create]
  resources :terms, only: [:index]
  resources :faqs, only: [:index]
  resources :abouts, only: [:index]
end
