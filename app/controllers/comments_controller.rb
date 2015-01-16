class CommentsController < ApplicationController
  before_action :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to([@commentable, :comments], :notice => I18n.t("admin.comments.create.success"))
    else
      flash.now[:error] = I18n.t("admin.comments.create.error")
      render(:new)
    end
  end

private

  def load_commentable
    klass = [Post, Project].detect { |c| params["#{c.name.underscore}_id"] }
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end

  def comment_params
    params.require(:comment).permit(:user, :email, :body)
  end

end
