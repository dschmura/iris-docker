# config/initializers/pundit.rb
# Extends the ApplicationController to add Pundit for authorization.
# Modify this file to change the behavior of a 'not authorized' error.
# Be sure to restart your server when you modify this file.
module PunditHelper
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end

  #def user_not_authorized
  #  #flash[:alert] = "Access denied. Please log in to continue"
  #  flash[:alert] = "You are not able to #{params[:action]} this #{params[:controller].singularize}. Please log in to continue"
  #  redirect_to (request.referrer || new_user_session_path)
  #end
#
end

ApplicationController.send :include, PunditHelper