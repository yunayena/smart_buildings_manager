class Sensor < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  has_many :measures
KINDS = [ ['Digital', 0], ['Analog', 1] ]
end
