module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-danger"
    when :alert then "alert alert-warning"
    end
  end

  def flash_icon(level)
    case level
    #when :notice then "alert alert-info"
    when :success then "fa fa-check-circle"
    when :error then "fa fa-times-circle"
    when :alert then "fa fa-exclamation-triangle"
    end
  end

  def get_active_menu_css(selector)
    puts params[:controller]
    puts "selector:" + selector
    res = ''
    if selector == params[:controller]
      puts "en if"
      res = 'active open'
    end
    return res
  end

  def head_title
    if params[:controller] == "consejeria"
      puts params
      return "Consejería"
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
