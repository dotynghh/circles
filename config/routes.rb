Rails.application.routes.draw do
  root 'welcome#index'
  resources :messages

  resources :users do
    get :blogs, on: :member
    post :add_friend, on: :collection
    get :friends, on: :member
  end
  resources :sessions
  resources :blogs do
    post :add_contents, on: :collection
  end

  namespace :admin do
    root 'users#index'

    resources :users do 
      collection do
        get :search
      end
     end   
   end


end
