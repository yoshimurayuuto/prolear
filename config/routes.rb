Rails.application.routes.draw do
  root 'conversations#index'
  resources :users, only: [:index]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :conversations do
    resources :messages
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
