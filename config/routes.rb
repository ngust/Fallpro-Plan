Rails.application.routes.draw do

resources :fallpro do
    get :started
    get :systems
    get :items
    get :setup
    get :pre_use
    get :rescue
    get :contact
    get :signature
    get :print_report
    get :edit_systems
    get :edit_gear
    get :edit_setup
    get :edit_inspection
    get :edit_rescue
    get :edit_contact
    get :emails
  end

  resource :fallpro_users, only: [:new, :create]
  resources :fallpro_sites do
    get :roof
    get :edit_roof 
  end
    resources :fallpro_hazards do
      get :power_lines
  end
  
  # root to: 'users/sessions#new_user_session_path'
    # devise_scope :user do
      # root to: "devise/sessions#new"
      root to: "pages#landing"
    # end

    resources :messages, only: [:new, :create]

    # devise_for :users, controllers: {
    #     sessions: 'users/sessions',
    #     registrations: 'users/registrations',
    #     invitations: 'users/invitations'
    #   }
    # root to: "devise/sessions#new"

      get "/pages/:page" => "pages#show"

end
