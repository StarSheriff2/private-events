class EventsController < ApplicationController
  before_action :set_user, only: %i[ new create ]

  def index
    @events = Event.all
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  # GET /events/1
  def show
    @event = Event.find(params[:id])
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  # GET /users/new
  def new
    @event = Event.new
  end

  # POST /users
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "The event was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      # @user = User.find(params[:id])
      @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :date, :location, :creator_id)
    end

end
