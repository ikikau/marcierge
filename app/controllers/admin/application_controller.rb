module Admin
  class ApplicationController < ActionController::Base

    layout 'admin'

    before_filter :authenticate_admin_user!


    #  User
    #-----------------------------------------------
    helper_method :is_admin?
    helper_method :is_current_user?

    def set_current_user
      User.current_user = current_user
    end
    def is_admin?
      user_signed_in? && current_user.try(:admin?)
    end
    def is_current_user?(id)
      user_signed_in? && current_user.id == id
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


    #  Devise
    #-----------------------------------------------
    def after_sign_in_path_for(scope)
      if request.referer.try(:include?, '/admin')
        admin_root_path
      else
        root_path
      end
    end

    def after_sign_out_path_for(scope)
      request.referer || root_path
    end

  end
end
