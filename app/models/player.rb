class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]

  validates :name, :email, :position, :number_shirt, presence: true
  validates :email, uniqueness: true
end
