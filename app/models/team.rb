class Team < ActiveRecord::Base
  validates :name, :color, presence: true
  has_and_belongs_to_many :players
end
