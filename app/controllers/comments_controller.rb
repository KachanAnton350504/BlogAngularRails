class CommentsController < ApplicationController
  before_action :set_post, only: [:show]
 # before_filter :authenticate_user!, only: [:create, :update]
  #load_and_authorize_resource
  
  def show
    max_per_page = 2
    paginate @post.comments.count, max_per_page do |limit, offset|
      render json: @post.comments.limit(limit).offset(offset)
    end
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(comment_params.merge(user_id: current_user.id))
    respond_with comment
  end


  private

    def set_post
      @post = Post.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
