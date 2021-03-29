class SessionsController < ApplicationController
  def create
    if User.exists?(name: params[:name])
      user = User.where(name: params[:name])
      session[:current_user_id] = user[0].id
      redirect_to root_url
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:current_user_id)
    redirect_to root_url
  end
end
