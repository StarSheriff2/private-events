class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  # GET /users/1 or /users/1.json
  def show
    if set_user
      @user = @set_user
    else
      redirect_to new_user_path
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:current_user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @set_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
