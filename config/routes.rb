Rsvp::Engine.routes.draw do
  root :to => "response#index"
  post "/", :to => "response#create", :as => "response_create"
  get "reply", :to => "response#edit"
  put "reply", :to => "response#update"
  get "confirmation", :to => "response#confirmation"
end
