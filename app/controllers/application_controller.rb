class ApplicationController < ActionController::Base
  include CleanPagination
	respond_to :json
  before_action :configure_permitted_parameters, if: :devise_controller?

	def angular
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
      
end


 