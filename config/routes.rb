Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config

  get '/dynamic_selects/cities', to: 'dynamic_selects#cities', as: 'dynamic_select_cities'

  get "/admin" => redirect("/en/admin")

  post "/auth/facebook", to: 'auth#facebook'
  post "/auth/google", to: 'auth#google'

  scope ':locale', defaults: { locale: I18n.locale } do
    ActiveAdmin.routes(self)
  end

  scope '/api' do
    scope '/v1' do
      scope '/assets' do
        get '/' => 'api_assets#index'
        post '/' => 'api_assets#create'
        scope '/:asset_id' do
          get '/' => 'api_assets#show'
          put '/' => 'api_assets#update'
        end
      end
      scope '/cities' do
        get '/' => 'api_cities#index'
        scope '/:city_id' do
          get '/' => 'api_cities#show'
        end
      end
      scope '/countries' do
        get '/' => 'api_countries#index'
        scope '/:country_id' do
          get '/' => 'api_cities#show'
        end
      end
    end
  end

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
