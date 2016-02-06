class SessionsController < ApplicationController
  def create
    user = User.find_by(login: params[:session][:login].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to rails_admin_path # поменять на страницу админа
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
