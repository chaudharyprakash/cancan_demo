class RegistrationsController < Devise::RegistrationsController

  # GET/resource/sign_up
  # def new
  #  super
  # end

  # POST/resource
  # def create
  #  super
  # end

  # GET/resource/edit
  # def edit
  #  @resource = User.find_by(id: params[:format])
  #  super
  # end

  # PUT/resource
  def update
    super
    @resource = resource
  end

  # DELETE /resource
  def destroy
    resource = User.find_by(id: params[:format])
    resource.destroy
    flash[:success] = 'user successfully deleted..'
    redirect_to users_path
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
