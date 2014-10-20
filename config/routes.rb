Tuflegrad::Application.routes.draw do

  root to: 'application#index'


  namespace :admin do
    resources :articles
    resources :shops
    resources :vacancies
    resource :setting
  end

  resources :articles
  resources :vacancies
  resources :comments

end
