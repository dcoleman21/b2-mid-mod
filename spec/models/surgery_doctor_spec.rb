require 'rails_helper'

RSpec.describe SurgeryDoctor, type: :model do
  describe 'relationships' do
    it { should belong_to :surgery }
    it { should belong_to :doctor }
  end
end
