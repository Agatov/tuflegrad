Tuflegrad::Application.routes.draw do

  root to: 'application#index'


  namespace :admin do
    resources :articles
    resources :shops
    resources :banners
    resources :vacancies
    resources :comments do
      get :approve, on: :member
    end
    resource :setting
  end

  resources :articles
  resources :vacancies do
    post :reply, on: :member
  end
  resources :comments

end
