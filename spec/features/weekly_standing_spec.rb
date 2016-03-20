require 'rails_helper'

RSpec.feature "Weekly Standing", type: :feature do
  let!(:weekly_standing) { create(:weekly_standing, :complete, season: 2016, round: 1) }
  let!(:matchs) { weekly_standing.matchs }
  let!(:players) { weekly_standing.players }

  before { visit "/scores/#{weekly_standing.season}/#{weekly_standing.round}" }

  describe 'Visualizar os jogos realizados na semana' do
    it 'exibir placar de cada jogo' do
      expect(page).to have_css('.scores > .score', count: 8)
    end

    it 'exibir o nome dos times' do
      expect(page).to have_css('.team > .team.name', count: 8)
    end
  end

  describe 'Visualizar o rank daquela semana' do

    it 'listar todos os jogadores' do
      expect(page).to have_css('.players > tbody > .player', count: 4)
    end

    it 'com a posição de cada jogador' do
      expect(page.all(:css, '.players > tbody  > .player > .position').map(&:text)).to match_array(players.map { |p| "##{p.standing.position}º" })
    end

    it 'com a ulltima posição de cada jogador' do
      expect(page.all(:css, '.players > tbody  > .player > .last_position').map(&:text)).to match_array(players.map { |p| "#{p.standing.difference_last_position}º" })
    end

    it 'exibir a vitórias de cada jogador' do
      expect(page.all(:css, '.players > tbody  > .player > .wins').map(&:text)).to match_array(players.map { |p| "#{p.standing.wins}" })
    end

    it 'exibir a derrotas de cada jogador' do
      expect(page.all(:css, '.players > tbody  > .player > .loss').map(&:text)).to match_array(players.map { |p| "#{p.standing.loss}" })
    end

    it 'exibir a empates de cada jogador' do
      expect(page.all(:css, '.players > tbody  > .player > .drawns').map(&:text)).to match_array(players.map { |p| "#{p.standing.drawn}" })
    end

    it 'exibir a media de cada jogador' do
      expect(page.all(:css, '.players > tbody  > .player > .average').map(&:text)).to match_array(players.map { |p| "#{p.standing.average}" })
    end

    it 'exibir a pontos de cada jogador' do
      expect(page.all(:css, '.players > tbody  > .player > .points').map(&:text)).to match_array(players.map { |p| "#{p.standing.points}" })
    end
  end
end

