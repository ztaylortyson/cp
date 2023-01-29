class ApplicationController < ActionController::Base
	before_action :configure_sign_up_params, only: [:create], if: :devise_controller?
	#before_action :authenticate_user!

	def configure_sign_up_params
    	devise_parameter_sanitizer.permit(:sign_up, keys: ['sbn'])
  	end

	def after_sign_out_path_for(_resource_or_scope)
		new_user_session_path
	end


end
