Rails.application.routes.draw do
  devise_for :users,  :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :questions
  resources :answers
  concern :commentable do
    resources :comments
  end
  resources :questions, concern: :commentable, shallow: true do
    resources :answers do
      resources :comments
    end
    resources :comments, shallow: true
  end

  root to: "questions#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
