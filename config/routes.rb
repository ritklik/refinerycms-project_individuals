Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :project_individuals do
    resources :project_individuals, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :project_individuals, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :project_individuals, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
