class Schedule < ActiveRecord::Base
  belongs_to :consejero, :class_name => 'User',:foreign_key=>'user_id'
  require 'tod'
  serialize :time, Tod::TimeOfDay
  @dias =['lunes','martes,','miercoles','jueves','viernes']
end
