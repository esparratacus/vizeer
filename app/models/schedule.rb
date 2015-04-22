# == Schema Information
#
# Table name: schedules
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  dia_semana  :string(255)
#  hora_inicio :time
#  hora_fin    :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Clase que modela los horarios de atención de los consejeros en objetos de tipo Schedule
class Schedule < ActiveRecord::Base
  belongs_to :consejero, :class_name => 'User',:foreign_key=>'user_id'
  require 'tod'
  serialize :time, Tod::TimeOfDay
  @dias =['lunes','martes,','miercoles','jueves','viernes']
end
