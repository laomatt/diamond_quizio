Rails.application.routes.draw do
  get 'questions/new'

  get 'categories/index'

  get 'categories/show'

  get 'users/sign_in' => 'users#sign_in'

  root 'users#front_page'

  resources :users do
    member do
      get 'show'
      get 'font_page'
    end
  end

  resources :comments

  resources :replies

  get 'user_info/:id/show_info' => "users#show"
  get 'user_info/me' => "users#me"

  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  namespace :manage do
    namespace :admins do
      get 'dashboard'
      get 'user_crud'
      get 'question_crud'
    end

    resources :categories do
      member do
        get 'show'
        get 'index'
        post 'update'
      end
    end

    resources :questions do
      member do
        get 'approve'
        get 'disapprove'
        get 'trash'
      end
    end

    namespace :questions do
      namespace :search do
      end
    end
    resources :users
  end

  devise_scope :user do
    get 'user_log_out_route/sign_out', :to => 'devise/sessions#destroy'
  end

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]

  resources :categories do
    member do
      get 'score'
      get 'tabulate_scores'
      get 'public_show'
      get 'private_show'
    end
  end

  get '/manage/questions/search/filter' => 'manage/questions#filter'
  resources :questions

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'users#front_page'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
