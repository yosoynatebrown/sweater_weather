Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      resources :backgrounds, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resources :road_trip, only: [:create]
      resources "book-search", :controller => :book_search, :as => :book_search
    end
  end
end
