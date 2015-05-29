class CoursesController < ApplicationController

  def set_course
    @materia=Course.find(params[:id])
  end
  def course_params
    params.require(:course).permit(:id,:nombre,:creditos, :descripcion,:intensidad,:dificultad,:utilidad,:numero_encuestas, sections_attributes: [:id,:course_id,:semestre,:estado])
  end

  def index
    @materias= Course.all
  end
  
  def catalogo
    @materias= Course.all.order(:nombre)
  end
  
  def show
    @materia= Course.find(params[:id])
  end

  def new
    @materia= Course.new
    @materia.sections.build
  end

  def create
    @materia = Course.new(course_params)
    @materia.numero_encuestas=0
    @materia.intensidad=0.0
    @materia.dificultad=0.0
    @materia.utilidad=0.0
    if @materia.save
      redirect_to :courses, :flash => { :success => 'Materia creada exitosamente.' }
    else
      render :action => 'index'
    end
  end
  def edit
    @materia=Course.find(params[:id])
    @materia.sections.build
  end
  def update
    puts "PARAMETROS DE ACTUALIZACION DE CURSO"
    puts params
    
    @materia=Course.find(params[:id])
    if @materia.update_attributes(course_params)
      redirect_to course_url(@materia), success: 'Datos de materia actualizados satisfactoriamente.'
      #redirect_to :courses, :flash => { :success => 'Datos de materia actualizados satisfactoriamente.' }
    else
      redirect_to :courses, :flash => { :error => 'No ha sido posible actualizar los datos de la materia.' }
    end
  end
  
  def agregar_seccion
    @materia= Course.find(params[:id])
    @seccion=@materia.sections.build
  end
  
  def cuestionario
    puts "PARAMETROS DE CUESTIONARIO"
    puts params
    @materia= Course.find(params[:id])
  end
  
  def guardar_resultados
    @materia= Course.find(params[:id])
    puts "PARAMETROS DE EVUALUACION"
    puts params
    @materia.dif_sum += params[:dificultad].to_i
    @materia.inten_sum += params[:intensidad].to_i
    @materia.util_sum += params[:utilidad].to_i
    @materia.numero_encuestas = @materia.numero_encuestas+1
    @materia.dificultad= @materia.dif_sum/@materia.numero_encuestas
    @materia.intensidad= @materia.inten_sum/@materia.numero_encuestas
    @materia.utilidad= @materia.util_sum/@materia.numero_encuestas
    if @materia.save
      redirect_to :courses, :flash => { :success => 'Materia evaluada correctamente.' }
    else
      redirect_to :courses, :flash => { :error => 'No ha sido posible guardar los datos de la materia.' }
    end
    
  end
  
  def destroy
    @materia = Course.find(params[:id])
    @materia.destroy
    redirect_to course_path, :flash => { :success => "Materia eliminada exitosamente."}
  end
end