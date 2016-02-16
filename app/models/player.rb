class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_and_belongs_to_many :teams
  has_one :standing
  has_many :match_reports

  validates :name, :email, :position, :number_shirt, presence: true
  validates :email, uniqueness: true

  def scores(match=nil)
    total_scores = match_reports.score
    total_scores = total_scores.where(match: match) if match
    total_scores.size
  end

  def red_cards(match=nil)
    total_scores = match_reports.red_card
    total_scores = total_scores.where(match: match) if match
    total_scores.size
  end

  def yellow_cards(match=nil)
    total_scores = match_reports.yellow_card
    total_scores = total_scores.where(match: match) if match
    total_scores.size
  end
end
