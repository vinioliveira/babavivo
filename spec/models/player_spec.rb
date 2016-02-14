require 'rails_helper'

RSpec.describe Player, type: :model do
  describe '#validation' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_uniqueness_of(:email) }
      it { is_expected.to validate_presence_of(:number_shirt) }
      it { is_expected.to validate_presence_of(:position) }
  end

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:teams) }
    it { is_expected.to have_one(:standing) }
  end
end
