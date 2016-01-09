require 'rails_helper'

RSpec.describe Player, type: :model do


  describe '#validation' do
      it { expect(subject).to validate_presence_of(:name) }
      it { expect(subject).to validate_presence_of(:email) }
      it { expect(subject).to validate_presence_of(:number_shirt) }
      it { expect(subject).to validate_presence_of(:position) }
      it { expect(subject).to validate_uniqueness_of(:email) }
  end

  describe 'associations' do
    it { expect(subject).to have_and_belong_to_many(:teams) }
    it { expect(subject).to have_one(:standing) }
  end
end
