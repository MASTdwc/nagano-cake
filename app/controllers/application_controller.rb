class ApplicationController < ActionController::Base
<<<<<<< HEAD
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name,:last_name_kana,:first_name_kana,:email,:encrypted_password,:postcode,:address,:phone_number])
  end

end
=======
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana,  :encrypted_password, :postcode, :address, :phone_number])
  end
end







>>>>>>> origin/develop
