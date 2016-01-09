class StandingsController < ApplicationController
  def overall
    @players = Player.includes(:standing).order('standings.position').all
  end
end
