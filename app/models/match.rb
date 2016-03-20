class Match < ActiveRecord::Base
  belongs_to :first_team, class_name: 'Team'
  belongs_to :second_team, class_name: 'Team'
  belongs_to :weekly_standing, inverse_of: :matchs
  has_one :match_report, inverse_of: :match


  def self.current
    find_by(ends_at: nil)
  end
end
