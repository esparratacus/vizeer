module ApplicationHelper
def flash_class(level)
  case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-danger"
    when :alert then "alert alert-alert"
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
  end
end
