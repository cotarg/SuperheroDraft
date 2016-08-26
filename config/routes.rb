Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'matches#index'

 
    resources :users
    resources :matches do
      resources :teams, :only => [:new, :create, :edit, :update]
    end
    resources :heroes
    resources :teams, :only => [:index, :show]


  get "/auth/:provider/callback" => "sessions#create"
  delete '/logout' => 'sessions#destroy'

end
