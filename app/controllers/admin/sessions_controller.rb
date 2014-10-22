class Admin::SessionsController < AdminController
  skip_before_filter :authorize_admin, :except => :destroy

  def new

  end

  # Find administrator by email and authenticate password. Session ID is set when all is OK.
  def create
    administrator = Administrator.find_by_email(params[:email])
    if administrator && administrator.authenticate(params[:password])
      session[:admin_id] = administrator.id
      redirect_to([:admin, :root], :notice => I18n.t("admin.sessions.create.success"))
    else
      flash.now[:error] = I18n.t("admin.sessions.create.error")
      render(:new)
    end
  end

  # Destroy the session i.e. 'Log out'.
  def destroy
    session[:admin_id] = nil
    redirect_to([:admin, :login], :notice => I18n.t("admin.sessions.destroy.success"))
  end

end
