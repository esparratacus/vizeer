class AppointmentsController < ApplicationController
  def user_params
      params.require(:user).permit(:id, :email, :password, :password_confirmation, :role_ids =>[])
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
    @cita = Appointment.new
  end

  def edit
    @cita = Appointment.find(params[:id])
  end

  def create
    @cita = Appointment.new(params[:user])

    if @cita.save
      redirect_to :appointments, :flash => { :success => 'User was successfully created.' }
    else
      render :action => 'new'
    end
  end

  def update
    @cita = Appointment.find(params[:id])
   
    if @cita.update_attributes(user_params)
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to :appointments, :flash => { :success => 'Datos de cita actualizados satisfactoriamente.' }
    else
      puts "Parametros"
      puts user_parama
      redirect_to :appointments, :flash => { :error => 'No ha sido posible actualizar los datos de Cita.' }
    end
  end

  def destroy
    @cita = Appointment.find(params[:id])
    @cita.destroy
    redirect_to appointments_path, :flash => { :success => 'Usuario eliminado del sistema.' }
  end
end
