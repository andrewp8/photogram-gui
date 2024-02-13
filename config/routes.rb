Rails.application.routes.draw do
  # ==== USER ====
  get("/", { :controller => "users", :action => "index"})
  get("/users", { :controller => "users", :action => "index"})
  # create
  post("/add_user", {:controller => "users", :action => "create"})
  # show
  get("/users/:path_username",{:controller => "users", :action => "show"})
  # update
  post("/update_user/:path_id", {:controller => "users", :action => "update"})

end
