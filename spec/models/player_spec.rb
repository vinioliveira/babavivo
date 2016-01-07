require 'rails_helper'

RSpec.describe Player, type: :model do


  describe '#validation' do
    it 'requrie name, position, number_shirt and email to be valid' do
      blank_player = Player.new
      expect(blank_player).to be_invalid
      expect(blank_player.errors.count).to be(4)
      expect(blank_player.errors).to have_key(:name)
      expect(blank_player.errors).to have_key(:email)
      expect(blank_player.errors).to have_key(:number_shirt)
      expect(blank_player.errors).to have_key(:position)
    end
  end


end
