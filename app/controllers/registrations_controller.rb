class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params
  before_filter :configure_account_update_params, only: [:update]

  # GET/resource/sign_up
  def new
     @users = User.new
  end

  # POST/resource
  def create

    @users = User.create(user_params)
    respond_to do |format|
      if @users.save
        sign_in(@users)
        format.html { redirect_to root_path }
        # format.html { render  'crop' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # GET/resource/edit
  # def edit
  #  super
  # end

  # PUT/resource
  def update
   @users = User.find_by_email(params[:user][:email])
   respond_to do |format|
    if @users.update_attributes(update_user_params)
      # format.html { redirect_to root_path, notice: 'user was successfully updated.' }
      format.html { redirect_to show_user_path(@users), notice: 'user was successfully updated.' }
    else
      format.html { render action: 'edit' }
    end
  end 
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
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :image
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :image
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def user_params
    params.require(:user).permit(:email,:password, :password_confirmation, :image_original_w, :image_original_h, :image_crop_x, :image_crop_y, :image_crop_w, :image_aspect, :image_box_w,:image_crop_h, :image) 
  end

  def update_user_params
    params.require(:user).permit(:image_original_w, :image_original_h, :image_crop_x, :image_crop_y, :image_crop_w, :image_aspect, :image_box_w,:image_crop_h, :image) 
  end
end
