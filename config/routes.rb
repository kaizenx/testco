Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor' # mount this first, otherwise rails admin can't access
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'
  
  
  devise_scope :user do
    get     '/sign_in',     to: 'devise/sessions#new',        as: :sign_in
    delete  '/sign_out',    to: 'devise/sessions#destroy',    as: :sign_out
    get     'settings/:id', to: 'devise/registrations#edit',  as: :settings
  end

  devise_for :users, path: "", path_names: { sign_in: 'sign_in', sign_out: 'sign_out', edit: 'settings' }
  
  resources :communities
  resources :services
  resources :profiles
  
  resources :locations do
    resources :location_mentorships
    resources :companies
    resources :pricings
  end

  resources :users
  resources :news
  resources :events
  resources :mentors
  resources :enquiries

  #static
  root to: 'static_pages#landing'
  get '/about_us', to: 'static_pages#about_us', as: :about_us
  get '/join_us', to: 'static_pages#join_us', as: :join_us
  match "/magazine" => redirect('http://blog.jointhe.co'), :as => :magazine, via: [:get]
  match "/facebook" => redirect('http://facebook.com/thecokl'), :as => :facebook, via: [:get]
  match "/twitter" => redirect('http://twitter.com/thecokl'), :as => :twitter, via: [:get]
  match "/instagram" => redirect('http://instagram.com/thecokl'), :as => :instagram, via: [:get]
end
