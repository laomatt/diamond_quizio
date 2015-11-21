Rails.application.routes.draw do
  get 'questions/new'

  get 'categories/index'

  get 'categories/show'

  root 'users#font_page'
  # resources :users do
  #   member do
  #     get 'show'
  #   end
  # end


  get 'user_info/:id/show_info' => "users#show"

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

    resources :questions
    resources :users
  end

  devise_scope :user do
    get 'user_log_out_route/sign_out', :to => 'devise/sessions#destroy'
  end

  resources :categories
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
