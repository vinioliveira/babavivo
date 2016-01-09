require 'rails_helper'

RSpec.feature "ManagePlayer", type: :feature do

  let!(:players) { create_list(:player, 5) }

  describe 'Qualquer usuário poderá' do
    context 'visualizar todos os jogadores cadastrados' do
      before { visit '/players' }

      it 'listar todos os jogadores' do
        expect(page).to have_css('.players > .player', count: 5)
      end

      it 'exibir o nome de todos os jogadores' do
        expect(page.all(:css, '.players > .player  .name').map(&:text)).to
          match_array(players.map { |player| player.standing.position })
      end

      it 'exibir a opção para excluir ou editar o jogador' do
        expect(page).to have_css('.players > .player a.edit', count: 5)
        expect(page).to have_css('.players > .player a.remove', count: 5)
      end
    end

    context 'cadastrar um novo jogador'do
      it 'com sucesso quando todos os dados forem corretos' do
        visit '/players/new'

        fill_in('player[name]', with:'Jhon Doe')
        fill_in('player[email]', with:'jhon.doe@email.com')
        fill_in('player[number_shirt]', with:'10')
        fill_in('player[position]', with:'10')

        click_button('Salvar')
        expect(page).to have_css('.ui.green.message', count:1)
      end

      it 'com erro quando nenhum campo for preenchido' do
        visit '/players/new'
        click_button('Salvar')
        expect(page).to have_css('.ui.red.message', count:1)
      end
    end

    context 'editar um usuário' do
      let(:current_player) { current_player = players.first }

      it 'com sucesso quando todos os dados forem corretos' do
        visit "/players/#{current_player.id}/edit"

        fill_in('player[name]', with: "#{current_player.name} new")
        click_button('Salvar')
        expect(page).to have_css('.ui.green.message', count:1)
      end

      it 'com erro quando nenhum campo for preenchido' do
        visit "/players/#{current_player.id}/edit"

        fill_in('player[name]', with: "")
        click_button('Salvar')
        expect(page).to have_css('.ui.red.message', count:1)
      end
    end

    context 'desativar um jogador' do
      it 'com sucesso' do
        visit "/players"
        first('.players > .player a.remove').click
        expect(page).to have_css('.ui.green.message', count:1)
      end
    end
  end
end

