Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :feeds
  root 'tops#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    collection do
      get :enter
      get :matching
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :conversations do
    resources :messages
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
