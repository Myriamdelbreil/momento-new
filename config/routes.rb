Rails.application.routes.draw do
  #test
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips do
    resources :accomodations, only: [:index, :new, :create, :destroy]
    resources :participants, only: [:new, :create]
    resources :transportations, only: [:index]
    resources :events, only: [:new, :create]
  end
  # resources :accomodation_votes, only: [:destroy]
  resources :accomodations, only: [:show, :edit, :update] do
    resources :accomodation_votes, only: [:destroy]
  end

  resources :transportations, only: [:show, :edit, :update, :index]
  resources :expenses, only: [:index, :edit, :update, :show, :destroy]
  resources :events, only: [:index, :edit, :update, :show, :destroy] do
    resources :event_participants, only: [:new, :create]
  end
  resources :participants, only: [:destroy] do
    resources :messages, only: [:show, :new, :create]
    resources :transportations, only: [:new, :create]
    resources :expenses, only: [:index, :new, :create]
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
