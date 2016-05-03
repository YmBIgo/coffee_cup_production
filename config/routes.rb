Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
# top page

  root to: "welcome#index"

# mugcups page

  get "/mugcups/:page" => "pages#show"

  get "/mugcups" => "pages#index"

# coffee_cups page

  get "/coffee_cups/:page" => "coffeecups#show"

  get "/coffee_cups" => "coffeecups#index"

# code page

  get "/codes" => "codes#index"

  get "/codes/:page" => "codes#show"

# users page

  resources :users, :only => [:edit, :update]

  get "/dashboard" => "users#index"

  get "/pay_info" => "users#pay_info"

  get "/pay_warning" => "users#pay_warning"

# info_page

  get "/privacypolicy" => "info_page#privacypolicy"

  get "/company"       => "info_page#company"

  get "/term"          => "info_page#term"

  get "/tokusho"       => "info_page#tokusho"

# 404

  match '*path' => 'application#error404', via: :all

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
