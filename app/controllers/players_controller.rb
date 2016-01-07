class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      flash[:success] = "Jogador cadastrado com sucesso"
      redirect_to action: :index
    else
      flash[:error] = "Por favor preencha os campos obrigatórios"
      render :new
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :email, :position, :number_shirt)
  end
end
