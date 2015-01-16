class PostsController < ApplicationController

  def index
    @posts = Post.published.recently_created
  end

  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
  end

end
