class ScoresController < ApplicationController
  def index
    @weekly_standing = WeeklyStanding.includes(:players, matchs: [:first_team, :second_team]).find_by!(season: params[:season], round: params[:round])
  end
end
