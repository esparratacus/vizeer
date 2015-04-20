# == Schema Information
#
# Table name: appointments
#
#  id           :integer          not null, primary key
#  consejero_id :integer
#  alumno_id    :integer
#  fecha        :datetime
#  estado       :string(255)
#  reporte      :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null


# Clase que representa un objeto de tipo Appointment 

class Appointment < ActiveRecord::Base
  resourcify
  belongs_to :consejero, :class_name => 'User', :foreign_key => 'consejero_id'
  belongs_to :alumno, :class_name => 'User', :foreign_key => 'alumno_id'
  require 'tod'
  
  # Método que calcula la próxima fecha del calendario de acuerdo a una hora y un día de la semana
  # * *Parámetros*    :
  #   - +hora+ -> hora de de la disponibilidad
  #   - +dia_semana+ -> Día de la semana de la disponibilidad
  # * *Returns* :
  #   - La fecha de acuerdo al día de la semana y hora como un objeto de tipo Datetime
  def disponibilidad(hora, dia_semana)
    puts "en Dispinibilidad"
    man= Time.now
    man= man +1.day
    while man.wday != dia_semana
      puts "dia semana"
      puts man.wday
      puts dia_semana
      man = man +1.day
    end
    hora = hora.to_time_of_day
    hora= hora.on man
    hora = DateTime.parse(hora.to_s)
    return hora
  end
  
end
