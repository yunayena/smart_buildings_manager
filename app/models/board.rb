class Board < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :sensors, dependent: :destroy

  validates :name, presence: true
end
