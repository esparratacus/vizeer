module ApplicationHelper
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
    if params[:controller] == "administracion"
      puts params
      return "Administración"
    end
  end
  
  def breadcrumbs
    if params[:controller] == "consejeria"
        puts params
        return "Consejería"
    end
    if params[:controller] == "administracion"
        puts params
        return "Administración"
    end
  end
end
