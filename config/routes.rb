Rails.application.routes.draw do
  resources :garments, only: %i[show index] do
    collection { get :current }
  end

  root 'garments#current'
end
