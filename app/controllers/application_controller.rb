class ApplicationController < ActionController::Base
    before_action :configured_permitted_parameters, if: :devise_controller?
    before_action :require_login
    before_action :require_correct_user, only: [:edit, :update, :edit_password, :update_password]
        
    protected
    def configured_permitted_parameters 
        devise_parameter_sanitizer.permit(:account_update, keys:[:avatar, :username, :email, :password, :password_confirmation,   :current_password])
    end

    private

    def require_correct_user
    end

    def require_login
        redirect_to login_path unless logged_in?
    end
end
