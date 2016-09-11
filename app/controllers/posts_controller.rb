class PostsController < ApplicationController
  authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
      render json: { error: exception.message }
  end
  
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
    rubric_ids = post_params[:rubric_ids]
    unless post_params[:body]&&post_params[:title]
      p = Post.create(post_params)
      render json: p.errors
      return;
    end
    unless rubric_ids
      render json: Rubric.create().errors
      return;
    end
    rubric_ids.each {|id| rubrics.push(Rubric.find(id)) } 
    post = Post.new(post_params.merge(user_id: current_user.id))
    post.rubrics << rubrics
    if post.save
      render json: post
    else
      render json: post.errors
    end 
  end

  private
     
    def post_params
      params.fetch(:post, {}).permit(:title, :body, :rubric_ids => [])
    end
end
