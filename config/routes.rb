Rails.application.routes.draw do
  resources :skus, only: [:index]
  resources :suppliers, only: [:index]
  resources :csv_files, only: [:index, :create]
  root to: 'csv_files#index'
end
