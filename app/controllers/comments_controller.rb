class CommentsController < ApplicationController
  before_action :set_post, only: [:show]
  skip_before_filter :authenticate_user!
  authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
      p exception.message
      render json: { error: {"Authorization": exception.message} }
  end
  def show
    max_per_page = 2
    paginate @post.comments.count, max_per_page do |limit, offset|
      render json: @post.comments.limit(limit).offset(offset)
    end
  end

  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params.merge(user_id: current_user.id))
    p comment
    if comment.save
      comment.post = post
      respond_with comment
    else
      p comment.errors
      render json: {"error": comment.errors }
    end
  end


  private

    def set_post
      @post = Post.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end