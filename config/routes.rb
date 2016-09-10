Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  mount Rich::Engine => '/rich', :as => 'rich'
  
  root to: 'application#angular', as: '/home'

  resources :comments
  resources :posts

   resources :posts, only: [:create, :index, :show] do
    resources :comments, only: [:show, :create] 
  end
  
 # mount Blog::API => '/'

  resources :rubrics, defaults: {format: 'json'}
  get "rubrics/name/:id", to: "rubrics#name", defaults: {format: 'json'}
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
   devise_for :users#, controllers: { sessions: 'users/sessions', 
  #                                 registrations: 'users/registrations'} 
  
end
