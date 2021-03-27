require 'rails_helper'

describe Attendance, type: :model do
  # Model Tests
  context 'check CRUD actions work' do
    before do
      @user = User.create(name: 'John Smith')
      @event = Event.new
      @attendace = Attendance.create(attendee: @user, attended_event: @event)
    end

    it 'checks that an attendance can be created' do
      expect(@attendace).to be_valid
    end

    it 'checks that an attendance can be read by attendee_id' do
      expect(Attendance.find_by(attendee: @user.id)).to eq(@attendace)
    end

    it 'checks that an attendance can be read by attended_event_id' do
      expect(Attendance.find_by(attended_event: @event.id)).to eq(@attendace)
    end
  end

  # Association Tests
  it { should belong_to(:attendee) }
  it { should belong_to(:attended_event) }
end
