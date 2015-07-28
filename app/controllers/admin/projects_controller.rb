class Admin::ProjectsController < AdminController
  before_action :find_project, :only => [:show, :edit, :update, :destroy]

  def index
    @projects = Project.recently_created.paginate(:page => params[:page])
  end

  def show

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.administrator_id = current_admin.id
    params[:project][:tag_ids].each do |tag_id|
      @project.tags << Tag.find(tag_id.to_i) unless tag_id == ""
    end
    if @project.save
      redirect_to([:admin, :projects], :notice => I18n.t("admin.projects.create.success"))
    else
      flash.now[:error] = I18n.t("admin.projects.create.error")
      render(:new)
    end
  end

  def edit

  end

  def update
    params[:project][:tag_ids].each do |tag_id|
      @project.tags << Tag.find(tag_id.to_i) unless tag_id == ""
    end
    if @project.update_attributes(project_params)
      redirect_to([:admin, :projects], :notice => I18n.t("admin.projects.create.success"))
    else
      flash.now[:error] = I18n.t("admin.projects.create.error")
      render(:edit)
    end
  end

  def destroy
    @project.destroy
    redirect_to([:admin, :projects], :notice => I18n.t("admin.projects.destroy.success"))
  end

private

  # Find post by ID
  def find_project
    @project = Project.find(params[:id])
  end

  # Set parameter permissions for post
  def project_params
    params.require(:project).permit(:title, :slug, :lead, :body, :administrator_id, :published, :published_on, :tag_ids)
end
