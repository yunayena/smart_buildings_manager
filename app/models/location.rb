class Location < ActiveRecord::Base
  belongs_to :building
  has_many :boards 
end
