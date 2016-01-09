class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_and_belongs_to_many :teams

  validates :name, :email, :position, :number_shirt, presence: true
  validates :email, uniqueness: true
end
