class UsersController < ApplicationController

private

  def user_params
    params.require(:user).permit(:login, :password,
                                 :password_confirmation)
  end
end
