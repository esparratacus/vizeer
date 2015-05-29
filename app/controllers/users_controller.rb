# Clase que se encarga de controlar las acciones concernientes a los objetos de tipo User
class UsersController < ApplicationController
  
  #Define los parámetros que son alterables por el controlador
  def user_params
      params.require(:user).permit(:id, :email, :password, :password_confirmation, :role_ids =>[])
  end
  
  # Método que accede a los registros de de tipo User 
  # * *Resultado*     :
  #   - se asigna a la variable @user una lista con objetos de tipo User encontrados en la base de datos
  def index
    @users = User.all
  end

  # Método que busca un registro de tipo User
  # * *Parámetros*    :
  #   - +id+ -> identificador único del objeto de tipo User
  # * *Resultado*     :
  #   - se asigna a la variable @user el objeto de tipo User encontrado en la base de datos
  def show
    @user = User.find(params[:id])
  end

  # Método que prepara un objeto de tipo User vacío
  # * *Resultado*     :
  #   - Se asigna a la varibla @user un objeto vacío de tipo User 
  def new
    @user = User.new
    set_default_role
  end

  # Método que busca un registro de tipo User y prepararlo para su edición
  # * *Parámetros*    :
  #   - +id+ -> identificador único del objeto de tipo User
  # * *Resultado*     :
  #   - Se almacena el objeto de tipo User en la variable @user para ser usado en la vista correspondiente
  def edit
    @user = User.find(params[:id])
  end

  # Método que guarda un objeto de tipo User en la base de datos
  # * *Parámetros*    :
  #   - +email+ -> String Correo electrónico 
  #   - +password+ -> String Constraseña
  #   - +password_confirmation+ -> String de confirmación de contraseña
  # * *Resultado*     :
  #   - El objeto de tipo User se guarda en la base de datos
  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to @user, :flash => { :success => 'Usuario creado exitosamente.' }
    else
      render :action => 'new'
    end
  end

  # Método que actualiza los datos de un Objeto de tipo User 
  # * *Parámetros*    :
  #   - +password+ -> String de contraseña
  #   - +password_confirmation+ -> String de confirmación de contraseña
  #   - +roles_ids -> arreglo con con los roles asociados al usuario 
  # * *Resultado*     :
  #   - El registro en la base de datos correspondiente al objeto de tipo user se actualiza correctamente
  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
     user_params[:role_ids] ||= []
    
    if @user.update_attributes(user_params)
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to :users, :flash => { :success => 'Datos de usuario actualizados satisfactoriamente.' }
    else
      puts "-ERROR DE ACTUALIZACION DE PERMISOS"
      puts user_params
      redirect_to :users, :flash => { :error => 'No ha sido posible actualizar los datos del usuario.' }
    end
  end
  
  # Método que elimina un registro de tipo Schedule
  # * *Parámetros*    :
  #   - +id+ -> identificador único del registro de tipo User
  # * *Resultado* :
  #   - El objeto de tipo User se elimina exitosamente de la base de datos
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :flash => { :success => 'Usuario eliminado del sistema.' }
  end
  
end
