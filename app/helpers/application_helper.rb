# Modulo de métodos de ayuda comunes a todas las vistas de la aplicación.
module ApplicationHelper
  
  # Método que define la clase HTML de la alerta generada por alguna acción
  # * *Parámetros* :
  #     - +level+ -> Tipo de alerta
  # * *Resultado* :
  #   - String con la clase HTML de la alerta 
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-danger"
    when :alert then "alert alert-warning"
    end
  end

  # Método que define la clase HTML del ícono de la alerta generada por alguna acción
  # * *Parámetros* :
  #     - +level+ -> Tipo de alerta
  # * *Resultado* :
  #   - String con la clase HTML del ícono de la alerta
  def flash_icon(level)
    case level
    #when :notice then "alert alert-info"
    when :success then "fa fa-check-circle"
    when :error then "fa fa-times-circle"
    when :alert then "fa fa-exclamation-triangle"
    end
  end

  # Método que define la clase HTML de la selección actual en el menu izquierdo de la aplicación
  # * *Parámetros* :
  #     - +selector+ -> Sección de la aplicación seleccionada
  # * *Resultado* :
  #   - String de la clase HTML que marca la seleccón de la sección
  def get_active_menu_css(selector)
    puts params[:controller]
    puts "selector:" + selector
    res = ''
    if selector == params[:controller]
      res = 'active open'
    end
    return res
  end

  # Método que define el título HTML del contenido de una sección de la aplicación
  # * *Parámetros* :
  #     - +selector+ -> Controlador activo
  # * *Resultado* :
  #   - String represantando el titulo de la sección
  def head_title
    if params[:controller] == "consejeria"
      puts params
      return "Inicio"
    end
    if params[:controller] == "users"
      puts params
      return "Usuarios"
    end
    if params[:controller] == "appointments"
      puts params
      return "Citas"
    end
    if params[:controller] == "schedules"
      puts params
      return "Mis horarios de atención"
    end
  end

  # Método que define los breadcrumbs de la aplicación
  # * *Parámetros* :
  #     - +selector+ -> Controlador activo
  # * *Resultado* :
  #   - String con el camino hacia el controlador actual de la aplicación
  def breadcrumbs
    if params[:controller] == "appointments"
      puts params
      return "Citas"
    end
    if params[:controller] == "users"
      puts params
      return "Usuarios"
    end
    if params[:controller] == "schedules"
      puts params
      return "Mis horarios de atención"
    end
  end
end
