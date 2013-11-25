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

end
