require 'rails_helper'

RSpec.describe Standing, type: :model do
  describe 'validation' do
    it { expect(subject).to validate_presence_of(:points) }
    it { expect(subject).to validate_presence_of(:wins) }
    it { expect(subject).to validate_presence_of(:loss) }
    it { expect(subject).to validate_presence_of(:drawn) }
    it { expect(subject).to validate_presence_of(:average) }
    it { expect(subject).to validate_presence_of(:matchs) }
    it { expect(subject).to validate_presence_of(:position) }
    it { expect(subject).to validate_presence_of(:last_position) }
  end

  describe 'associations' do
    it { expect(subject).to belong_to(:player) }
  end

  describe '#difference_last_position' do
    it 'return number wich represent the diference positions' do
      standing = create(:standing, position: 1, last_position: 3)
      expect(standing.difference_last_position).to be(2)
    end

    it 'return number wich represent the diference positions when negative' do
      standing = create(:standing, position: 5, last_position: 4)
      expect(standing.difference_last_position).to be(-1)
    end

  end
end
