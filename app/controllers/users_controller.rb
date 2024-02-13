class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})
    render({:template => "user_templates/index"})
  end

  def show
    the_username = params.fetch("path_username")
    @the_user = User.where({:username => the_username}).first
    
    render({:template => "user_templates/show"})
  end

  def create
    @the_user = User.new
    @the_user.username = params.fetch("input_username")

    if @the_user.username.present?
      @the_user.save
      redirect_to("/users/#{@the_user.username}", { :notice => "User created successfully."} )
    else
      redirect_to("/users", { :alert => "User failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    matching_user = User.find(the_id)
    matching_user.username = params.fetch("input_username")

    if matching_user.username.present?
      matching_user.save
      redirect_to("/users/#{matching_user.username}", { :notice => "User updated successfully."} )
    else
      redirect_to("/users", { :alert => "User failed to update successfully." })
    end
  end
end
