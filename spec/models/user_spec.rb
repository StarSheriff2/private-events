require 'rails_helper'

describe User, type: :model do
  # Model Tests
  context 'check CRUD actions work' do
    before do
      @user = User.create(name: 'John Smith')
    end

    it 'checks that a user can be created' do
      expect(@user).to be_valid
    end

    it 'checks that a user can be read' do
      expect(User.find_by(name: 'John Smith')).to eq(@user)
    end
  end

  # Association Tests
  it { should have_many(:created_events) }
  it { should have_many(:attendances) }
  it { should have_many(:attended_events) }

  # Validation Tests
  it 'is not valid without valid attributes' do
    expect(User.new).to_not be_valid
  end
  context 'it is valid with valid attributes' do
    describe '#name' do
      it { should validate_presence_of(:name) }
    end
  end
end
