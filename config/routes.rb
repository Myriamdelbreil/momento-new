Rails.application.routes.draw do
  #test
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips do
    resources :accomodations, only: [:index, :new, :create, :destroy]
    resources :participants, only: [:create]
    resources :transportations, only: [:index, :create]
    resources :events, only: [:create]
  end

  resources :accomodations, only: [:show, :update] do
    resources :accomodation_votes, only: [:destroy]
  end

  resources :transportations, only: [:show, :update, :index]
  resources :expenses, only: [:index, :update, :show, :destroy]

  resources :events, only: [:index, :update, :show, :destroy] do
    resources :event_participants, only: [:create]
  end

  resources :participants, only: [:destroy] do
    resources :messages, only: [:show, :create]
    resources :expenses, only: [:index, :create]
    resources :accomodations, only: [] do
      resources :accomodation_votes, only: [:new, :create]
    end
  end

  resources :event_participants, only: [:destroy]
  resources :accomodations, only: [] do
    member do
      get :confirm_accomodation
    end
  end
end
