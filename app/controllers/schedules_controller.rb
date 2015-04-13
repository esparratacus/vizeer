class SchedulesController < ApplicationController
  def schedule_params
      params.require(:schedule).permit(:id,:user_id,:dia_semana, :hora_inicio, :hora_fin)
    end
  def index
    @horarios= Schedule.all
  end

  def show
  end

  def new
    @dias =['lunes','martes','miercoles','jueves','viernes']
    @horario=Schedule.new
  end

  def create
    @horario = Schedule.new(schedule_params)
    @horario.user_id=current_user.id
    puts "PARAMETROS------------------"
    puts params
    
    if @horario.save
      redirect_to :schedules, :flash => { :success => 'User was successfully created.' }
    else
      render :action => 'index'
    end
  end

  def update
  end

  def destroy
    @user = Schedule.find(params[:id])
    @user.destroy
    redirect_to schedules_path, :flash => { :success => 'Horario eliminado correctamente.' }
  end
end
