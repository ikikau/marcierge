module Admin
  class ApplicationController < ActionController::Base

    layout 'admin'

    before_filter :authenticate_admin_user!

    #  User
    #-----------------------------------------------
    helper_method :is_current_user?

    def is_current_user?(id)
      admin_user_signed_in? && current_admin_user.id == id
    end

    #  Previous Params
    #-----------------------------------------------
    def previous_params
      flash[:params] || params
    end
    def save_current_params
      flash[:params] = params
    end


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
end
