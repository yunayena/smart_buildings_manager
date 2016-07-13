class Location < ActiveRecord::Base
  belongs_to :building
  belongs_to :user
  has_many :boards, dependent: :destroy

  validates :name, presence: true
end
