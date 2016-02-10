require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:weekly_standing) }
    it { is_expected.to belong_to(:second_team) }
    it { is_expected.to belong_to(:first_team) }
    it { is_expected.to have_one(:match_report) }
  end
end
