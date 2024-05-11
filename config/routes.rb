Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  get "up" => "rails/health#show", as: :rails_health_check
  namespace :v1 do
    resources :users, only: %i[create,me] do
		get :me, on: :collection
		post :create, on: :collection
	end

	post 'auth/login', to: 'auth#login'
	get 'auth/logout', to: 'auth#logout'
	
	resources :books, only: %i[list,show,create] do
		get :list, on: :collection
		get :show, on: :member
		post :create, on: :collection
	end

	resources :cart_items, only: %i[list,create,update,delete] do
		get :list, on: :collection
		post :create, on: :collection
		patch :update, on: :collection
		delete :delete, on: :collection
	end

	resources :orders, only: %i[payment] do
		get :payment, on: :collection
	end
  end



  # Defines the root path route ("/")
  # root "posts#index"
end
