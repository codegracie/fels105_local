Rails.application.routes.draw do
  get 'words/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root    "home#index"
  get     "about"       => "home#about", as: "about"
  get     "contact"     => "home#contact", as: "contact"
  get     "faq"         => "home#faq", as: "faq"
  get     "words"       => "words#index", as: "words"
  get     "signup"      => "users#new"
  get     "login"       => "sessions#new"
  get     "/results/:id", to: "results#show", as: "result"
  post    "login"       => "sessions#create"
  delete  "logout"      => "sessions#destroy"

  resources :users do
    member do
      resources :relationships, only: [:index, :create, :destroy]
    end
  end
  resources :user_sets
  resources :categories
  resources :lessons
  resources :lesson_words
  resources :account_activations, only: [:edit]
  resources :relationships,       only: [:create, :destroy]

  namespace :admin do
    root "dashboard#index"
    resources :categories
    resources :words
    resources :answers
    resources :users
  end

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