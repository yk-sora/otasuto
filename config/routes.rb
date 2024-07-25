Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }
  
  scope module: :public do
    root "homes#top"
    get "/about" => "homes#about"
    resources :posts, only:[:new, :show, :index, :create]
    #root to: "posts#index"
  end
  
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
