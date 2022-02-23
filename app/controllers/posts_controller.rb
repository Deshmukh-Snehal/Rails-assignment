class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sport
  before_action :set_post, only: [:update, :show, :destroy]

  # List All Posts API
  def index
    @posts = @sport.posts(page).per(per_page)
    render_success 200, true, 'Posts fetched successfully', @posts.as_json   
  end  

  # Create an Posts API
  def create
    @post = @sport.posts.new(post_params)
    if @post.save
      render_success 200, true, 'Post created successfully', @post.as_json
    else
    if @post.errors
      errors = @post.errors.full_messages.join(", ")
    else
      errors = 'Post creation failed'
    end
      return_error 500, false, errors, {}
    end
  end

  # Update Posts API
  def update
    if @post.update(post_params)
      render_success 200, true, 'Post updated successfully', @post.as_json
    else
      if @post.errors
        errors = @post.errors.full_messages.join(", ")
      else
        errors = 'Post update failed'
      end
      return_error 500, false, errors, {}
    end
  end

  # Fetch an Posts API
  def show
    render_success 200, true, 'Post fetched successfully', @post.as_json
  end

  # Delete an Posts API
  def destroy
    @post.destroy
    render_success 200, true, 'Post deleted successfully', {}
  end
  
  private
  def set_sport
    @sport = Sport.where(id: params[:sport_id]).first
    unless @sport
      return return_error 404, false, 'Product not found', {}
    end
  end

  # Strong parameters of Posts
  def post_params
    params.require(:post).permit(:title,:description,:image, :sport_id, :user_id)
  end

  # Set posts Object, Return Error if not found
  def set_post
    @post = @sport.posts.where(id: params[:id]).first
    unless @post
      return return_error 404, false, 'Post not found', {}
    end
  end

  # Kaminari Pagination method
  def page
    @page ||= params[:page] || 1
  end

  # Kaminari Pagination method for per page
  def per_pag
    @per_page ||= params[:per_page] || 10
  end
end