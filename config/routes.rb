Refinery::Core::Engine.routes.draw do
  namespace :admin, :path => Refinery::Core.backend_route do
    resources :resource_categories, :except => :show do
      post :update_positions, on: :collection
    end
  end
end