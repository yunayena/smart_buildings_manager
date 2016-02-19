class Sensor < ActiveRecord::Base
  belongs_to :board
  has_many :measures
end
