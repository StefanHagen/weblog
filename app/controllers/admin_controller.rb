class AdminController < ApplicationController
  # Make sure the admin namespace is password protected
  before_action :authorize_admin

  # Use a different layout view for the admin namespace
  layout 'admin'

private
  
  # Find the current admin if a session ID is given
  helper_method :current_admin
  def current_admin
    @current_admin = Administrator.find_by_id(session[:admin_id]) if session[:admin_id]
  end

  # Redirect to the login screen when a current_admin is not set
  def authorize_admin
    redirect_to :admin_login unless current_admin
  end

end
