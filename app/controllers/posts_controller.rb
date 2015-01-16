class PostsController < ApplicationController

  def index
    @posts = Post.recently_created
  end

  def show
    @post = Post.find(params[:id])
  end

end
