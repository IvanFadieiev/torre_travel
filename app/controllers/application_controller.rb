class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  after_filter :reset_last_captcha_code!
  before_action :commercials
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def commercials
    @commercials = Commercial.all
  end
end
