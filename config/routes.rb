Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }
  
  scope module: :public do
    root "homes#top"
    get "/about" => "homes#about"
    
    get '/companions/my_page', to: 'companions#show'
    get '/companions/information/edit', to: 'companions#edit'
    patch '/companions/information', to: 'companions#update'
    
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
    end
    #root to: "posts#index"
  end
  
  resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
