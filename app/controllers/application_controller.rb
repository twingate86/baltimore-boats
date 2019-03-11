class ApplicationController < ActionController::Base
    before_action :store_user_location!, if: :storable_location?
    protect_from_forgery with: :exception
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to main_app.root_url, alert: exception.message
    end
private 
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      # :user is the scope we are authenticating
      store_location_for(:user, request.fullpath)
    end
    def after_sign_in_path_for(resource_or_scope)
        stored_location_for(resource_or_scope) || super
    end
    def after_sign_out_path_for(resource_or_scope)
        request.referrer
    end
end
