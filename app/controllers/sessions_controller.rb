class SessionsController < ApplicationController
  def new
  end
  
  def create
    session[:current_user_id] = @user.id
  end

  def destroy
  end
end