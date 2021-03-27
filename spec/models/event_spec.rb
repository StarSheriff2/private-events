require 'rails_helper'

describe Event, :type => :model do
  # Model Tests
  context "check CRUD actions work" do
    before do
      @event = Event.create(title: 'My_event', description: 'description', location: 'location', date: DateTime.now, creator: User.new)
    end

    it 'checks that an event can be created' do
      expect(@event).to be_valid
    end

    it 'checks that an event can be read' do
      expect(Event.find_by_title("My_event")).to eq(@event)
    end
  end

  # Association Tests
  it { should have_many(:attendances) }
  it { should have_many(:attendees) }
  it { should belong_to(:creator) }

  # Validation Tests
  it "is not valid without valid attributes" do
    expect(Event.new).to_not be_valid
  end
  context "it is valid with valid attributes" do
    describe '#title' do
      it { should validate_presence_of(:title) }
    end

    describe '#date' do
      it { should validate_presence_of(:date) }
    end

    describe '#description' do
      it { should validate_presence_of(:description) }
    end

    describe '#location' do
      it { should validate_presence_of(:location) }
    end
  end
end


