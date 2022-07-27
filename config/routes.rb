Rails.application.routes.draw do
  root "stakeholders/lists#show"

  scope :stakeholders, except: :index do
    resource :report, module: :stakeholders, only: [:show, :update]
    resource :list, module: :stakeholders, only: [:show, :update]
  end

  resources :stakeholders, module: :stakeholders
end
