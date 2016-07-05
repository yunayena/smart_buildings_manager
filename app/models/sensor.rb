class Sensor < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  has_many :measures, dependent: :destroy

  KINDS = [ ['Digital', 0], ['Analog', 1] ]
end
