Tuflegrad::Application.routes.draw do

  root to: 'application#index'


  namespace :admin do
    resources :articles
    resources :shops
    resources :vacancies
  end

  resources :articles
  resources :vacancies

end
