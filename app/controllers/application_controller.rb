class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #This is required to use will_paginate with the classrooms_controller index method to filter on visible
  require 'will_paginate/array'

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  # devise provides current_user if a user has logged in, otherwise set it to guest so Pundit doesn't puke.
  def pundit_user
    current_user || "guest"
  end


  helper :all # include all helpers, all the time

  # Determine the IP address of the requester to @ip
  # Match the @ip using regex to a list of known campus ip addresses (NOT INCLUDING THE GUEST NETWORK)
  # If a match is not found (the requestor is off campus or not logged in)
  # force the user to use ssl (and thus requiring a kerberos login, this requirement is
  # part of the server setup.)
  # The list of campus network blocks is available http://www.itcom.itd.umich.edu/backbone/umnet/

  def redirect_https
    @ip = request.remote_ip
    if @ip.match(/172.17.0/) 
      return true
    end
    redirect_to protocol: "https://" unless (request.ssl? || @ip.match(/141.211.|141.212.|141.213.|141.214.|141.215.|35.1.|35.2.|35.3.|67.194.|192.168.1.|127.0.0.1|::1/))
    return true
  end
    before_action :redirect_https
  private
    def mobile_device?
      request.user_agent =~ /Mobile|webOS/
    end
    helper_method :mobile_device?
end
