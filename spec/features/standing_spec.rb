require 'rails_helper'

RSpec.feature "Standing", type: :feature do
  let!(:players) { create_list(:player, 5) }
  let!(:standings) { players.map {|player| create(:standing, player: player, weekly_standing: nil)}}

  describe 'Rank de todos os jogadores' do
    before { visit '/standings/overall' }

    it 'listar todos os jogadores' do
      expect(page).to have_css('.players > tbody > .player', count: 5)
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

