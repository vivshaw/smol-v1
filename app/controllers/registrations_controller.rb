class RegistrationsController < Devise::RegistrationsController
  def update
    @user = User.find(current_user.id)
    email_changed = @user.email != params[:user][:email]
    is_omniauth = !@user.provider.blank?

    successfully_updated = if !is_omniauth
      @user.update_with_password user_params
    else
      @user.update_without_password user_params
    end

    if successfully_updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :description, :colortheme, :password, :password_confirmation, :current_password)
  end

end
