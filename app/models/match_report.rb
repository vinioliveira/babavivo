class MatchReport < ActiveRecord::Base
  enum report: [:score, :yellow_card, :red_card]

  belongs_to :match
  belongs_to :player

  validates :player, :match, uniqueness: true
end
