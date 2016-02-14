require 'rails_helper'

RSpec.feature "ManagePlayer", type: :feature do
  let!(:match) { create(:match) }
  let(:teams) { [match.first_team, match.second_team] }

  describe 'Visualizar todas as informações de um jogo' do
    before { visit "/matches/#{match.id}" }

    it 'Visualizar o nome do primeiro time' do
      expect(page).to have_css('.team > .first.team.name', count: 1, text: match.first_team.name)
    end

    it 'Visualizar o nome do segundo time' do
      expect(page).to have_css('.team > .second.team.name', count: 1, text: match.second_team.name)
    end

    it 'Visualizar o placar do segundo time' do
      expect(page).to have_css('.scores > .second.team.score', count: 1, text: match.second_team_score)
    end

    it 'Visualizar o placar do primeiro time' do
      expect(page).to have_css('.scores > .first.team.score', count: 1, text: match.first_team_score)
    end

    it 'com os jogadores do primeiro time' do
      expect(page).to have_css(".team_#{match.first_team.id} .players .player .name", count: 4, text: /John Doe/)
    end

    it 'com os jogadores do segundo time' do
      expect(page).to have_css(".team_#{match.second_team.id} .players .player .name", count: 4, text: /John Doe/)
    end

    it 'Visualizar o gols do jogador' do
      expect(page).to have_css('.players .player .stats > .score', count: 8, text: /[0-9]/)
    end

    it 'Visualizar o cartão amarelo do jogador' do
      expect(page).to have_css('.players .player .stats > .yellow.card', count: 8, text: /[0-9]/)
    end

    it 'Visualizar o cartão vermelho do jogador' do
      expect(page).to have_css('.players .player .stats > .red.card', count: 8, text: /[0-9]/)
    end
  end
end

