class ApplicationController < ActionController::Base

  protect_from_forgery


  #  Utils
  #-----------------------------------------------
  helper_method :controller_namespace

  def controller_namespace
    path = self.class.name.split '::'
    name = controller_name.capitalize

    if path.second
      path.first.downcase
    elsif !!(Module.const_get(name) rescue false)
      name.downcase
    else
      nil
    end
  end


  #  Devise
  #-----------------------------------------------
  def after_sign_in_path_for(resource)
    case resource
    when AdminUser then admin_root_path
    else root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when AdminUser then admin_root_path
    else root_path
    end
  end

end
