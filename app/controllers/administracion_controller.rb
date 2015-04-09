class AdministracionController < ApplicationController
  def index
    @usuarios = User.all
  end
  
  def editar_usuario
    puts "entré aqui"
    @Usuario=User.find(params[:id])
    puts "el usuario es:"
    puts @Usuario    
  end
  
  def new
    @Usuario=User.new
  end
  
  def actualizar_usuario
  end
end
