class UsersController < ApplicationController
  def user_params
      params.require(:user).permit(:id, :email, :password, :password_confirmation, :role_ids =>[])
    end
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    set_default_role
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to @user, :flash => { :success => 'User was successfully created.' }
    else
      render :action => 'new'
    end
  end

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
      puts "Parametros"
      puts user_parama
      redirect_to :users, :flash => { :error => 'No ha sido posible actualizar los datos del usuario.' }
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :flash => { :success => 'Usuario eliminado del sistema.' }
  end
  
end
