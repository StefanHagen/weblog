class Admin::AdministratorsController < AdminController
  before_action :find_administrator, :only => [:show, :edit, :update, :destroy]

  def index
    @administrators = Administrators.recently_created.paginate(:page => params[:page])
  end

  def show

  end

  def new
    @administrator = Administrator.new
  end

  def create
    @administrator = Administrator.new(administrator_params)
    if @admin.save
      redirect_to([:admin, :administrators], :notice => I18n.t("admin.administrators.create.success"))
    else
      flash.now[:error] = I18n.t("admin.administrators.create.error"))
      render(:new)
    end
  end

  def edit

  end

  def update
    if @administrator.update_attributes(administrator_params)
      redirect_to([:admin, :administrators], :notice => I18n.t("admin.administrators.update.success"))
    else
      flash.now[:error] = I18n.t("admin.administrators.update.error")
      render(:edit)
    end
  end

  def destroy
    @administrator.destroy
    redirect_to([:admin, :administrators], :notice I18n.t("admin.administrators.destroy.success"))
  end

private

  # Find Administrator by ID
  def find_administrator
    @administrator = Administrator.find(params[:id])
  end

  # Set parameter permissions for Administrators
  def administrator_params
    params.require(:administrator).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
