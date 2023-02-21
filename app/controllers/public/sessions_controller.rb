# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_customer, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  def after_sign_in_path_for(resource)
    items_path
  end
  
  def after_sign_out_path_for(resource)
    new_customer_session_path
  end
  
protected
  
  def reject_customer
   @customer = Customer.find_by(email: params[:customer][:email])
   return if !@customer
   puts 'test1'
   
   if @customer.valid_password?(params[:customer][:password]) && @customer.is_customer_deleted
     flash[:notice] = "退会済みです。再度ご登録をお願い致します。"
     puts 'test2'
     redirect_to new_customer_session_path
   else
     puts 'test3'
     customer_session_path
   end
  end
end



