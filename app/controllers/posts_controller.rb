class PostsController < ApplicationController
  authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
      render json: { error: exception.message }
  end
skip_before_filter :authenticate_user!
  
  def index
    max_per_page = 2
    paginate Post.order("created_at DESC").count, max_per_page do |limit, offset|
      render json: Post.order("created_at DESC").limit(limit).offset(offset)
    end
  end

  def show
    render json: Post.find(params[:id])
  end

  def create
    rubrics = []
    unless params[:body]&&params[:title]
      p = Post.create(title:params[:title],body:params[:body])
      render json: p.errors
      return;
    end
    unless params[:rubric_ids]
      render json: Rubric.create().errors
      return;
    end
    if params[:rubric_ids].size < 2
      rubrics.push(Rubric.find(params[:rubric_ids]))
    else
      params[:rubric_ids].each {|id| rubrics.push(Rubric.find(id)) } 
    end
    post = Post.new(post_params.merge(user_id: current_user.id))
    post.rubrics << rubrics
    if post.save
      respond_with post
    else
      render json: post.errors
    end 
  end

  private
     
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
