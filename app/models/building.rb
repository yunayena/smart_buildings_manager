class Building < ActiveRecord::Base
  has_many :locations, dependent: :destroy
  has_and_belongs_to_many :users
end
