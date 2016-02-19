class Board < ActiveRecord::Base
  belongs_to :location
  has_many :sensors
end
