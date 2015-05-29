class SectionsController < ApplicationController
  def section_params
   params.require(:section).permit(:id,:course_id,:semestre,:estado)
  end
  
  def index
  end
  
  def new
   @seccion = Section.new
  end
  
  def edit
    @seccion= Section.find(params[:id])
  end
  
  def create
    
  end
  def show
    @seccion = Section.find(params[:id])
  end
end