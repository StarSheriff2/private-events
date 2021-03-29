class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new(attended_event_id: params[:attended_event_id], attendee_id: params[:attendee_id])

    respond_to do |format|
      if @attendance.save
        format.html do
          redirect_to event_path(@attendance.attended_event_id), notice: 'You registered succesfully to this event.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
end
