class AppointmentsController < ApplicationController
  def appointment_params
      params.require(:appointment).permit(:id,:alumno_id,:fecha ,:consejero_id,:estado,:reporte)
    end
  def index
    if current_user.has_role? :estudiante
      @citas = Appointment.where :alumno_id =>current_user.id
    end
    if current_user.has_role? :consejero
      @citas = Appointment.where :consejero_id =>current_user.id
    end
  end

  def show
    @cita = Appointment.find(params[:id])
  end
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

  def edit
    @cita = Appointment.find(params[:id])
  end
  def confirmar_cita
    @cita = Appointment.find(params[:id])
    @cita.estado="CONFIRMADA"
    if @cita.save
      redirect_to :appointments, :flash => { :success => 'Su cita ha sido confirmada satisfactoriamente' }
    else
      render :action =>'index'
    end
  end
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

  def destroy
    @cita = Appointment.find(params[:id])
    @cita.destroy
    redirect_to appointments_path, :flash => { :success => 'Cita eliminada del sistema.' }
  end
end
