class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :buildings

  has_many :boards
  has_many :locations
  has_many :sensors
  has_many :measures

validates :email, email_format: { message: "Doesn't look like an email address" }

  def is_admin?
    admin
  end
end
