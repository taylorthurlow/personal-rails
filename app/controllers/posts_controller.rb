class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:index, :show]
  respond_to :html
  responders :flash

  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(10)
    respond_with @posts
  end

  def archive
    @posts = Post.order(created_at: :desc)
    respond_with @posts
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.save
    respond_with @post
  end

  def update
    @post.update(post_params)
    respond_with @post
  end

  def destroy
    @post.destroy
    respond_with @post
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :tag_line, :contents)
    end
end
