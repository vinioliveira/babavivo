class WeeklyStanding < ActiveRecord::Base
  has_many :matchs, inverse_of: :weekly_standing
  has_many :standings, inverse_of: :weekly_standing
  has_many :players, through: :standings
end
