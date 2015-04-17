class Appointment < ActiveRecord::Base
  resourcify
  belongs_to :consejero, :class_name => 'User', :foreign_key => 'consejero_id'
  belongs_to :alumno, :class_name => 'User', :foreign_key => 'alumno_id'
  require 'tod'
  
  def disponibilidad(hora, dia_semana)
    puts "en Disoinibilidad"
    man= Time.now
    man= man +1.day
    while man.wday != dia_semana
      puts "dia semana"
      puts man.wday
      puts dia_semana
      man = man +1.day
    end
    hora = hora.to_time_of_day
    
    hora.on man
    hora = DateTime.parse(hora.to_s)
    puts hora
    return hora
  end
  
end
