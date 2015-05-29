# Clase encargada de controlar las acciones de objetos de tipo Schedule entre la base de datos y la vista 
class SchedulesController < ApplicationController
  
  #Define los parámetros que son alterables por el controlador
  def schedule_params
    params.require(:schedule).permit(:id,:user_id,:dia_semana, :hora_inicio, :hora_fin)
  end
  
  # Método que accede a los registros de de tipo Schedule del consejero
  # * *Resultado* :
  #   - Lista de objetos de tipo Schedule almacenado en la variable @horarios
  def index
    @horarios= Schedule.where :user_id => current_user.id
  end


  # CU016-R02
  # Método que prepara el objeto de tipo Schedule para crearlo
  # * *Resultado* :
  #   - Asigna a un objeto de tipo Schedule vacío a la variable @horario
  def new
    @dias =['lunes','martes','miercoles','jueves','viernes']
    @horario=Schedule.new
  end

  # CU016-R02
  # Método que agrega un objeto de tipo Schedule a la base de datos
  # * *Parámetros* :
  #   - +user_params+ -> hash con la información del objeto de tipo Schedule
  # * *Resultado* :
  #   - Un nuevo horario de tipo Schedule se guarda como registro en la base de datos
  def create
    @horario = Schedule.new(schedule_params)
    @horario.user_id=current_user.id
    puts "PARAMETROS------------------"
    puts params
    @horario.hora_fin = @horario.hora_inicio + 3600
    
    if @horario.save
      redirect_to :schedules, :flash => { :success => 'Horario de atención creado exitosamente.' }
    else
      render :action => 'index'
    end
  end

  def update
  end
  
  # Método que elimina un registro de tipo Schedule
  # * *Parámetros*    :
  #   - +id+ -> identificador único del registro de tipo Schedule
  # * *Resultado* :
  #   - El horario se elimina exitosamente
  def destroy
    @user = Schedule.find(params[:id])
    @user.destroy
    redirect_to schedules_path, :flash => { :success => 'Horario eliminado correctamente.' }
  end
end
