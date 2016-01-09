require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validation' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:color) }
  end

  describe 'associations' do
    it { expect(subject).to have_and_belong_to_many(:players) }
  end
end
