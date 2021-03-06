Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get  '/'        => 'home#index'
  get  '/about'   => 'home#about'

  resources :projects
  resources :tasks
  resources :discussions
  resources :comments
end
