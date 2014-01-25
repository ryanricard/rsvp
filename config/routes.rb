Rsvp::Engine.routes.draw do
  root :to => "session#index"
  get :sign_in, :controller => :session, :action => :index
  post :sign_in, :controller => :session, :action => :create
  get :sign_out, :controller => :session, :action => :destroy
  resources :response, :only => [:index, :create] do
    collection do
      get :overview, :action => :show, :as => :show
      get :confirmation, :action => :confirmation
    end
  end
end
