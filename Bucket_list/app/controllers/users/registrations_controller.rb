class Users::RegistrationsController < Devise::RegistrationsController

  private

  def signup_params
    binding.pry
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
