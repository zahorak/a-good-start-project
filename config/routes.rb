GoodStart::Application.routes.draw do

  resources :immunizations
  devise_for :users
  resources :users
  resources :localities
  resources :countries
  resources :menu_items
  resources :surveys
  resources :enrollment_over_times
  resources :school_results
  resources :attendance_results
  resources :attendances
  resources :institutions
  resources :child_profiles
  resources :family_profiles
  resources :articles

  match '/kindergartens'  => 'institutions#index', :category => 105
  match '/schools'  => 'institutions#index', :category => 107
  match '/hotline'  => 'articles#show', :id => 1

  match '/check_survey_number'  => 'surveys#check_survey_number'
  match '/save_mediator_to_session'  => 'surveys#save_mediator_to_session'
  match '/save_locality_id_to_session'  => 'surveys#save_locality_id_to_session'
  match 'surveys/:id/mark_for_delete', :to => 'surveys#mark_for_delete'
  match 'surveys/:id/mark_as_verified', :to => 'surveys#mark_as_verified'
  match 'surveys/mark_for_delete/:id', :to => 'surveys#mark_for_delete'
  match '/institutions/:id/show/:enter_child', :to => 'institutions#show'
  match '/institutions/:id/edit_children', :to => 'institutions#edit_children'
  match "/institutions/set_date_to_session", :to => "institutions#set_date_to_session"
  match "/institutions/show_children_form/:child_id", :to => "institutions#show_children_form"
  match "/family_profiles/update_mini/:id", :to => "family_profiles#update_mini"
  match "/stats_detail", :to => "users#detail"

  # match ':controller(/:action(/:id(.:format)))'
  # resource :survey, :collection => { :start => :get}
  
  # scope '/translate' do
  #   match '/translate_list', :to => 'translate#index'
  #   match '/translate', :to => 'translate#translate'
  #   match '/translate_reload', :to => 'translate#reload', :as => 'translate_reload'
  # end
  root :to => "users#show"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
