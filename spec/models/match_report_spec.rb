require 'rails_helper'

RSpec.describe MatchReport, type: :model do
  describe 'validation' do
    it { expect(create(:match_report)).to validate_uniqueness_of(:player)}
    it { expect(create(:match_report)).to validate_uniqueness_of(:match) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:match) }
    it { is_expected.to belong_to(:player) }
  end
end
