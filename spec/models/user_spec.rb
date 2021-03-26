require 'rails_helper'

describe User, :type => :model do
  # Model Tests
  context "check CRUD actions work" do
    before do
      @user = User.create(name: 'John Smith')
    end

    it 'checks that a user can be created' do
      expect(@user).to be_valid
    end

    it 'checks that a user can be read' do
      expect(User.find_by(name: "John Smith")).to eq(@user)
    end
  end

  # Association Tests
  xit { should have_many(:attendances) }
  xit { should have_many(:attendees) }
  xit { should belong_to(:creator) }

  # Validation Tests
  xit "is not valid without valid attributes" do
    expect(Event.new).to_not be_valid
  end

  describe '#title' do
    xit { should validate_presence_of(:title) }
  end

  describe '#date' do
    xit { should validate_presence_of(:date) }
  end

  describe '#description' do
    xit { should validate_presence_of(:description) }
  end

  describe '#location' do
    xit { should validate_presence_of(:location) }
  end
end
