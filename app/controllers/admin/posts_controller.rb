class Admin::PostsController < AdminController
  before_action :find_post, :only => [:show, :edit, :update, :destroy]

  def index
    @posts = Post.recently_created.paginate(:page => params[:page])
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.administrator_id = current_admin.id
    params[:post][:tag_ids].each do |tag_id|
      @post.tags << Tag.find(tag_id.to_i) unless tag_id == ""
    end
    if @post.save
      redirect_to([:admin, :posts], :notice => I18n.t("admin.posts.create.success"))
    else
      flash.now[:error] = I18n.t("admin.posts.create.error")
      render(:new)
    end
  end

  def edit

  end

  def update
    params[:post][:tag_ids].each do |tag_id|
      @post.tags << Tag.find(tag_id.to_i) unless tag_id == ""
    end
    if @post.update_attributes(post_params)
      redirect_to([:admin, :posts], :notice => I18n.t("admin.posts.create.success"))
    else
      flash.now[:error] = I18n.t("admin.posts.create.error")
      render(:edit)
    end
  end

  def destroy
    @post.destroy
    redirect_to([:admin, :posts], :notice => I18n.t("admin.posts.destroy.success"))
  end

private

  # Find post by ID
  def find_post
    @post = Post.find(params[:id])
  end

  # Set parameter permissions for post
  def post_params
    params.require(:post).permit(:title, :lead, :body, :administrator_id, :tag_ids)
  end

end
