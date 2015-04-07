class AdministracionController < ApplicationController
  def index
    @usuarios = User.all
  end
  def edit
    
  end
end
