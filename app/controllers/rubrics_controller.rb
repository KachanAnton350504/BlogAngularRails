class RubricsController < ApplicationController
  #load_and_authorize_resource
  
  def index
    respond_with Rubric.all
  end

  def show
    posts = Rubric.find(params[:id]).posts.order("created_at DESC")
    max_per_page = 2
    paginate posts.count, max_per_page do |limit, offset|
      render json: posts.limit(limit).offset(offset) 
    end
  end

  def new
    @rubric = Rubric.new
  end

  def create
  end

 
  private
    
    def rubric_params
      params.require(:rubric).permit(:name)
    end
end
