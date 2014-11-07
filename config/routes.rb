Tuflegrad::Application.routes.draw do

  root to: 'application#index'


  namespace :admin do
    resources :articles
    resources :shops
    resources :vacancies
    resources :comments do
      get :approve, on: :member
    end
    resource :setting
  end

  resources :articles
  resources :vacancies
  resources :comments

end
