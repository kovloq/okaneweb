Rails.application.routes.draw do


  get 'fibonacci/index'

  devise_for :members,controllers: { sessions: "members/sessions",registrations:"members/registrations",:omniauth_callbacks => "members/omniauth_callbacks" }

  # devise_scope :member do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_member_session
  # end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'user/home#index'
 # root 'home#index'
get "home/kontak"
get "home/about"
get "home/benefits"
get "home/blog"
post "home/contact"
match 'administrator', to: 'administrator/home#index', via: [:get]
match 'user', to: 'user/home#index', via: [:get]

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
    namespace :administrator do
      
      post 'login/login'
      get 'login/index'
      get 'login/logout'
      resources :admin
      resources :contact
      resources :member
      resources :category
      resources :faq
    end

    namespace :user do
      
      resources :transaction
      resources :income
      resources :expense
      
      get 'faq/show'
      # Setting 
      get 'setting/show'
      get 'setting/delete'
      delete 'setting/delete_member'
      get 'setting/profile'
      get 'setting/password'
      patch 'setting/update'
      patch 'setting/update_password'
      # Report 
      get 'report/index'
      get 'report/new'
      get 'report/create'
      get 'home/index'
    end

    # resource :member, only: [:edit] do
    #   collection do
    #     patch 'user/setting/update_password'
    #   end
    # end

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
