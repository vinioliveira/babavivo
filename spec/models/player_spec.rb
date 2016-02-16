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

  describe '.scores' do
    context 'returns all the scores for a player' do
      let!(:match) { create(:match) }
      let!(:second_match) { create(:match) }
      let!(:player) { create(:player) }
      let!(:scores) { create_list(:match_report, 2, player: player, match: match, report: :score) }
      let!(:scores_in_second_match) { create_list(:match_report, 4, player: player, match: second_match, report: :score) }
      let!(:other) { create_list(:match_report, 2, player: player, match: match, report: :yellow_card) }

      context 'when give a match' do
        it 'returns only scores reports' do
          expect(player.scores(match)).to be(2)
          expect(player.scores(second_match)).to be(4)
        end
      end

      context 'when does not give a match' do
        it 'returns all scores reports' do
          expect(player.scores).to be(6)
        end
      end
    end
  end
end
