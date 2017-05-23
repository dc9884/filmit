Rails.application.routes.draw do
  devise_for :users
  root to: "movies#index"
  # Routes for the Location resource:
  # CREATE
  get "/locations/new", :controller => "locations", :action => "new"
  post "/create_location", :controller => "locations", :action => "create"

  # READ
  get "/locations", :controller => "locations", :action => "index"
  get "/locations/:id", :controller => "locations", :action => "show"

  # UPDATE
  get "/locations/:id/edit", :controller => "locations", :action => "edit"
  post "/update_location/:id", :controller => "locations", :action => "update"

  # DELETE
  get "/delete_location/:id", :controller => "locations", :action => "destroy"
  #------------------------------

  # Routes for the Permit resource:
  # CREATE
  get "/permits/new", :controller => "permits", :action => "new"
  post "/create_permit", :controller => "permits", :action => "create"

  # READ
  get "/permits", :controller => "permits", :action => "index"
  get "/permits/:id", :controller => "permits", :action => "show"

  # UPDATE
  get "/permits/:id/edit", :controller => "permits", :action => "edit"
  post "/update_permit/:id", :controller => "permits", :action => "update"

  # DELETE
  get "/delete_permit/:id", :controller => "permits", :action => "destroy"
  #------------------------------

  # Routes for the Movie resource:
  # CREATE
  get "/movies/new", :controller => "movies", :action => "new"
  post "/create_movie", :controller => "movies", :action => "create"

  # READ
  get "/movies", :controller => "movies", :action => "index"
  get "/movies/:id", :controller => "movies", :action => "show"

  # UPDATE
  get "/movies/:id/edit", :controller => "movies", :action => "edit"
  post "/update_movie/:id", :controller => "movies", :action => "update"

  # DELETE
  get "/delete_movie/:id", :controller => "movies", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
