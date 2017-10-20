Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users,  :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :questions
  resources :answers
  concern :commentable do
    resources :comments
  end
  resources :questions,concern: :commentable, shallow: true do
    resources :answers do
      resources :comments
    end
    resources :comments, shallow: true
  end

  namespace :api do
    namespace :v1 do
      resource :profiles do
        get :me, on: :collection
        get :all, on: :collection
      end
      resources :questions do
        get '/:id/answers', to: 'questions#answers', on: :collection
        get 'answers/:id', to: 'questions#answer', on: :collection
      end
    end
  end
  root to: "questions#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
