class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  # session[:current_user_id] = user.id

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = @_current_user
    @events = @_current_user.created_events.all
  end

  # GET /users/new
  def new
    @user = User.new
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:current_user_id] = @user.id
        format.html { redirect_to @user, notice: "User was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name)
    end
end
