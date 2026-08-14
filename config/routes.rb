Rails.application.routes.draw do
  root "site#home"

  resources :conteudos
  resources :projetos
  resources :professors
  resources :alunos
  resource :session
  resources :passwords, param: :token

  get "up" => "rails/health#show", as: :rails_health_check
end
