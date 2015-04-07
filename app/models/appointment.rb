class Appointment < ActiveRecord::Base
  resourcify
  belongs_to :consejero, :class_name => 'user', :foreign_key => 'consejero_id'
  belongs_to :alumno, :class_name => 'user', :foreign_key => 'alumno_id'
end
