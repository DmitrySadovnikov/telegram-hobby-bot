Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :hobbies, only: %i[] do
        collection do
          get :titles, defaults: { format: :json }
          get :random, defaults: { format: :json }
        end
      end
    end
  end
end
