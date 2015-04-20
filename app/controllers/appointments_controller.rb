# Clase encargada de controlar las acciones concernientes a los objetos de tipo Appointment
class AppointmentsController < ApplicationController

  # Parámetros permitidos para aleterar provenientes de la vista
  def appointment_params
      params.require(:appointment).permit(:id,:alumno_id,:fecha ,:consejero_id,:estado,:reporte)
    end
  # Muestra un listado de los objetos de tipo Appointment asociados al usuario. Estos objetos dependen del rol de usuario si es de tipo consejero o estudiante
  def index
    if current_user.has_role? :estudiante
      @citas = Appointment.where :alumno_id =>current_user.id
    end
    if current_user.has_role? :consejero
      @citas = Appointment.where :consejero_id =>current_user.id
    end
  end
  
  # Retorna el registro de tipo Appointment solicitado por el usuario
  def show
    @cita = Appointment.find(params[:id])
  end
  
  # Prepara la información requerida para la solicitud de un cita
  def new
    @dia_semana= Hash.new
    @dia_semana['Lunes']=1
    @dia_semana['Martes']=2
    @dia_semana['Miercoles']=3
    @dia_semana['Jueves']=4
    @dia_semana['Viernes']=5
    @appointment=Appointment.new
    @horarios= Array.new
    Schedule.all.each do |sc|
      cita = Appointment.new
      cita.fecha = cita.disponibilidad(sc.hora_inicio,@dia_semana[sc.dia_semana])
      cita.consejero_id=sc.user_id
      cita.alumno_id= current_user.id
      cita.estado = "PENDIENTE"
      @horarios<<cita
    end
  end

  # Prepara la información del registro buscado para su edición
  # * *Parámetros*    :
  #   - +id+ -> identificador único del objeto de tipo Appointment
  # * *Resultado*     :
  #   - se asigna a la variable @cita el objeto de tipo Appointment encontrado en la base de datos
  def edit
    @cita = Appointment.find(params[:id])
  end
  
  # Cambia el estado de una cita de "PENDIENTE" a "COFIRMADA"
  # * *Parámetros*    :
  #   - +id+ -> identificador único del consejero
  # * *Resultado* :
  #   - Se cambia el atributo Estado del objeto Appointment y se guarda en la base de datos 
  def confirmar_cita
    @cita = Appointment.find(params[:id])
    @cita.estado="CONFIRMADA"
    if @cita.save
      redirect_to :appointments, :flash => { :success => 'Su cita ha sido confirmada satisfactoriamente' }
    else
      render :action =>'index'
    end
  end
  
  # Guarda el reporte de la cita generado por el consejero
  # * *Parámetros*    :
  #   - +id+ -> identificador único del objeto de tipo Appointment
  #   - +reporte+ -> Text representando el acta de la cita
  # * *Resultado* :
  #   - Se inserta el reporte en el registro de la cita en la base de datos y se modifica el estado de la cita a CONCLUIDA
  def generar_reporte
    @cita = Appointment.find(params[:appointment][:id])
    @cita.reporte= params[:appointment][:reporte]
    @cita.estado="CONCLUIDA"
    if @cita.save
      redirect_to :appointments, :flash => { :success => 'Su cita ha concluido satisfactoriamente' }
    else
      render :action =>'index'
    end
  end
  
  # Guarda los datos de la cita en la base de datos
  # * *Parámetros*    :
  #   - +consejeror_id+ -> identificador único del consejero
  #   - +alumno_id+ -> identificador único del alumno
  #   - +fecha+ -> Fecha de tipo DateTime de la cita
  # * *Resultado* :
  #   - El objeto de tipo de Appointment se guarda exitosamente en la base de datos
  def create
    puts "---- parametros de creacion----"
    puts params
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to :appointments, :flash => { :success => 'Su cita ha sido creada satisfactoriamente' }
    else
      render :action => 'index'
    end
  end

  # Actualiza los datos de un objeto de tipo Appointment
  # * *Parámetros*    :
  #   - +id+ -> Identificador único del registro de tipo Appointment a modificar
  #   - +fecha+ -> Nueva fecha de tipo DateTime 
  # * *Resultado* :
  #   - Los cambios en el registro se guardan exitosamente en la base de datos
  def update
    @cita = Appointment.find(params[:id])
   
    if @cita.update_attributes(user_params)
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to :appointments, :flash => { :success => 'Datos de cita actualizados satisfactoriamente.' }
    else
      puts "Parametros"
      redirect_to :appointments, :flash => { :error => 'No ha sido posible actualizar los datos de Cita.' }
    end
  end

  #Elimina un registro de tipo Appointment de la base de datos
  # * *Parámetros*    :
  #   - +id+ -> Identificador único del registro de tipo Appointment a eliminar
  # * *Resultado* :
  #   - El registro representado por el objeto Appointment se elimina exitosamente de la base de datos
  def destroy
    @cita = Appointment.find(params[:id])
    @cita.destroy
    redirect_to appointments_path, :flash => { :success => 'Cita eliminada del sistema.' }
  end
end
