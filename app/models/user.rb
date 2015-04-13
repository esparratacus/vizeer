class User < ActiveRecord::Base
  rolify
  has_many :appointments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :set_default_role
  def set_default_role
    self.add_role :estudiante
  end
end
