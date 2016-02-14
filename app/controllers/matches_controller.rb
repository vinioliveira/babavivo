class MatchesController < ApplicationController
  def index
  end

  def show
    @match = Match.includes(:first_team, :second_team).find(params[:id])
    respond_with @match
  end
end
