class SessionsController < ApplicationController

  # "Create" a login, aka "log the user in"
  def create
    if @user = User.where(name: params[:name])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = @user[0].id
      redirect_to root_url
    end
  end

  # "Delete" a login, aka "log the user out"
  def destroy
    # Remove the user id from the session
    session.delete(:current_user_id)
    # Clear the memoized current user
    @_current_user = nil
    redirect_to root_url
  end
end
