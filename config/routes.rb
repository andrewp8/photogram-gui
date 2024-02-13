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

  # ==== PHOTO ====
  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:path_id", {:controller => "photos", :action => "show"})
  #  create
  post("/insert_photo_record", {:controller => "photos", :action => "create"})
  # update
  post("/update_photo/:path_id", {:controller => "photos", :action => "update"})
  # delete
  get("/delete_photo/:path_id", {:controller => "photos", :action => "destroy"})

  # ==== COMMENT ====
  # create
  post("/add_comment", {:controller => "comments", :action => "create"})

end
