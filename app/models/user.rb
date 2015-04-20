# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  role                   :string(255)
#

# Clase que modela los usuarios de acuerdo a las campos en la base de datos
class User < ActiveRecord::Base
  rolify
  has_many :appointments
  has_many :schedules
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :set_default_role
  
  # Método que establece el rol (Role) de estudiante como predeterminado
  # * *Resultado* :
  #   - Asocia al objeto de tipo User el rol de Estudiante.
  def set_default_role
    self.add_role :estudiante
  end
end
