require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:weekly_standing) }
    it { is_expected.to belong_to(:second_team) }
    it { is_expected.to belong_to(:first_team) }
    it { is_expected.to have_one(:match_report) }
  end

  describe 'scopes' do
    context '.current' do
      let!(:finisehd_matchs) { create_list(:match, 3, ends_at: Time.now) }
      let!(:unfinisehd_matchs) { create(:match) }

      it 'returns only finished matches' do
        expect(described_class.count).to eql(4)
        expect(described_class.current).to eql(unfinisehd_matchs)
      end
    end
  end
end
