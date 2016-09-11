class CommentsController < ApplicationController
  before_action :set_post, only: [:show]
  skip_before_filter :authenticate_user!
  authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
      render json: { error: {"authorization": exception.message} }
  end
  def show
    max_per_page = 2
    paginate @post.comments.count, max_per_page do |limit, offset|
      render json: @post.comments.limit(limit).offset(offset)
    end
  end

  def create
    post = Post.find(comment_params[:post_id])
    comment = Comment.new(comment_params.merge(user_id: current_user.id))
    comment.post = post
    
    if comment.save
      render json: comment
    else
      render json: {"error": comment.errors }
    end
  end


  private

    def set_post
      @post = Post.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end
end
