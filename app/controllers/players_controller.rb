class PlayersController < ApplicationController
  responders :flash

  def index
    @players = Player.all
  end

  def edit
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def update
    @player = Player.find(params[:id])
    @player.update_attributes(player_params)
    respond_with @player, location: -> { players_path }
  end

  def create
    @player = Player.create(player_params)
    respond_with @player, location: -> { players_path }
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    respond_with @player, location: -> { players_path }
  end

  private

  def player_params
    params.require(:player).permit(:name, :email, :position, :number_shirt)
  end
end
