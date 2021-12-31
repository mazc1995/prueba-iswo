Rails.application.routes.draw do
  resources :document_types
  resources :documents do
    member do
      put 'update_workflow_state'
    end
  end
  resources :procedures
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #put 'documents/:id/update_workflow_state', to: 'documents#update_workflow'
end
