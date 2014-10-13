Tuflegrad::Application.routes.draw do


  namespace :admin do
    resources :articles
    resources :shops
    resources :vacancies
  end
end
