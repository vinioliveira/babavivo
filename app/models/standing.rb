class Standing < ActiveRecord::Base
  belongs_to :player

  validates :points,
            :wins,
            :loss,
            :drawn,
            :average,
            :matchs,
            :position,
            :last_position,
            presence: true


  def difference_last_position
    last_position - position
  end
end
