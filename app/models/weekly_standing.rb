class WeeklyStanding < ActiveRecord::Base
  has_many :matchs, inverse_of: :weekly_standing
  has_many :standings, inverse_of: :weekly_standing
  has_many :players, through: :standings

  def self.current
    if last_weekly_standing = last
      if last_weekly_standing.created_at.to_date.cweek == DateTime.current.cweek
        return last_weekly_standing
      end
    end
    create
  end
end
