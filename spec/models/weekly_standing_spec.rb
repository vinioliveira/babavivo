require 'rails_helper'

RSpec.describe WeeklyStanding, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:matchs).inverse_of(:weekly_standing) }
    it { is_expected.to have_many(:standings).inverse_of(:weekly_standing) }
    it { is_expected.to have_many(:players).through(:standings) }
  end

  describe 'current' do
    it 'returns an instance of weekly_standing' do
      expect(described_class.current).to be_a(WeeklyStanding)
    end

    it 'creates a new weekly_standing' do
      expect{ described_class.current }.to change{ described_class.count }.from(0).to(1)
    end

    it 'returns the weekly_standing of the current week' do
      current_weekly_standing = create(:weekly_standing, :complete, round: 1)
      expect(described_class.current).to eql(current_weekly_standing)
    end

    it 'creates the weekly_standing of the current week if doesnt exist' do
      old_current = create(:weekly_standing, :complete, round: 1)
      travel 2.weeks do
        expect{ described_class.current }.to change{ described_class.count }.from(1).to(2)
        expect(described_class.current).not_to eql(old_current)
      end
    end
  end
end
