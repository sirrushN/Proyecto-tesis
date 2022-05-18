Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :records
  resources :courses
  resources :subjects
  resources :professors
  resources :students
  get '/informs', to: 'informs#index'
  get '/form', to: 'informs#form'
  #get '/informs_pdf' to: 'informs#index', :format => 'pdf'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
