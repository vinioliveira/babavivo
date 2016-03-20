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

  describe '.start' do
    let(:first_team) { create(:team, color: 'red', name: 'Team 1') }
    let(:second_team) { create(:team, color: 'green', name: 'Team 1') }
    let(:weekly_standing) { create(:weekly_standing) }

    let(:attrs) do
      {
        first_team: first_team,
        second_team: second_team,
        weekly_standing: weekly_standing
      }
    end

    it 'returns a new instance of current match' do
      expect(described_class.start(attrs)).to be_a(Match)
    end

    it 'creates a new match' do
      expect { described_class.start(attrs) }.to change {
        described_class.count
      }.from(0).to(1)
    end

    it 'creates a new match with two team' do
      match = described_class.start(attrs)
      expect(match.first_team).to eql(first_team)
      expect(match.second_team).to eql(second_team)
    end

    context 'exists un current match' do
      let!(:unfinisehd_matchs) { create(:match) }

      it 'does not create a new match if exists a current match' do
        expect { described_class.start(attrs) }.not_to change {
          described_class.count
        }.from(1)
      end
      it 'returns the current match if exists on active' do
        expect(described_class.start(attrs)).to eql(unfinisehd_matchs)
      end
    end
  end
end
