require 'rails_helper'

describe Event, :type => :model do
  it { should have_many(:attendances) }
end
# describe Check do
#   describe '#start' do
#     subject(:check_start) { described_class.new }
#     let(:file) { instance_double(File) }

#     it 'sends each_line' do
#       expect(file).to receive(:each_line)
#       check_start.start(file)
#     end

#     context 'when file has 1 line' do
#       it 'calls check_line once' do
#         expect(check_start).to receive(:check_line).once
#         file = StringIO.new('1')
#         check_start.start(file)
#       end
#     end
#   end
# end
