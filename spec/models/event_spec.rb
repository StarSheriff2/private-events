require 'rails_helper'

describe Event, :type => :model do
  # Association Tests
  it { should have_many(:attendances) }
  it { should have_many(:attendees) }
  it { should belong_to(:creator) }

  # Validation Tests
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


