Astronamer::Application.routes.draw do

  devise_for :clubs
  get '/auth/:provider/callback', to: 'sessions#create'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get '/session' => 'home#debug_session'

  get '/clubs/current' => 'clubs#current'

  get '/the_process'   => "home#the_process"
  get '/the_exoworlds' => "home#the_exoworlds"

  resources :systems do
    member do
      post 'add_club_vote'
      post 'remove_club_vote'
      post 'add_club_name'
      post 'remove_club_name'
      post 'create_club_suggestion'
      post 'remove_club_suggestion'
    end
  end


  resources :planets do
    member do
      post 'add_public_vote'
      post 'remove_public_vote'
      post 'add_club_vote'
      post 'remove_club_vote'
      post 'add_club_name'
      post 'remove_club_name'
    end
  end

  resources :clubs
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
