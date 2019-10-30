Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end

    post :start, on: :member
  end

  resources :taken_tests, only: %i[show update] do
    member do
      get :result
    end
  end

end
