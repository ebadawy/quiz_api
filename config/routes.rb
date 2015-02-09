Rails.application.routes.draw do
  resources :results, except: [:new, :edit]
  resources :answers, except: [:new, :edit]
  resources :choices, except: [:new, :edit]

  resources :questions do
    resources :choices
  end
  
  resources :quizzes do
    resources :questions do
      resources :choices
    end
  end
  
  resources :groups do
    resources :users
  end
# /users/:user_id/quizzes/:quiz_id/questions/:question_id/answer  
  resources :users do
    resources :groups
    resources :quizzes do
      resources :questions do
        resources :answers
      end
      resources :answers
      resources :results
    end
  end
  
  get "login" => "users#login"
  
  # get "users/:group_name" => "users#show_groups"
  # post "users/:group_name" => "users#add_group"
  
  # get "groups/:user_name" => "users#show_users"
  # post "groups/:user_name" => "users#add_user"
  
  # get "quizzes/:name" => "users#show_quizzes"
  # post "quizzes/:name" => "users#add_quiz"
  
  # get "users/:group_name" => "users#show_groups"
  # post "users/:group_name" => "users#add_group"

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
