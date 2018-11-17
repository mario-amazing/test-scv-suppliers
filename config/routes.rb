Rails.application.routes.draw do
  resources :csv_files, only: [:index, :create]
  root to: 'csv_files#index'
end
