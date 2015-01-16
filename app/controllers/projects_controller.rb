class ProjectsController < ApplicationController

  def index
    @projects = Project.published.recently_created
  end

  def show
    @project = Project.find(params[:id])
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new
  end

end
