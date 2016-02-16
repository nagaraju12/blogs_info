Rails.application.routes.draw do
  devise_for :users

  mount Ckeditor::Engine => '/ckeditor'
  get 'welcome/index'
resources :masseges
resources :friends
 resources :users, only: [:index, :show, :destroy, :new] do
 	resources :albums
 end
resources :articles do
  resources :comments
end
devise_scope :user do
  root to: "devise/registrations#new"
end

  resources :friendships do
    member do
      put :accepted_friends
      put :rejected_friends
    end
  end
  resources :masseges
end
