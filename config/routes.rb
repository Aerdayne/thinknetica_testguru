Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :tests, only: :index do
    resources :questions, only: :show, shallow: true do
      resources :answers, only: :show, shallow: true
    end

    post :start, on: :member
  end

  resources :taken_tests, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests, shallow: true do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end
end
