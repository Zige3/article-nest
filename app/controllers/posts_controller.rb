class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_post_owner, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:user, :tags).order(created_at: :desc)
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      attach_tags
      redirect_to @post, notice: "Post created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      @post.post_tags.destroy_all
      attach_tags
      redirect_to @post, notice: "Post updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted successfully."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authorize_post_owner
    unless @post.user == current_user
      redirect_to @post, alert: "You are not authorized to do that."
    end
  end

  def attach_tags
    return unless params[:post][:tag_names]

    tag_names = params[:post][:tag_names].split(",").map(&:strip).reject(&:blank?).uniq

    tag_names.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      @post.tags << tag unless @post.tags.include?(tag)
    end
  end
end