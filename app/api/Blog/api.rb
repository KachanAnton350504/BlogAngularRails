# require 'cancancan'
# module Twitter
#   class API < Grape::API
#     version 'v1', using: :header, vendor: 'twitter'
#     format :json
#    # prefix :api
#
#    include Grape::Kaminari
#   authorize_routes!
#   rescue_from CanCan::AccessDenied do |exception|
#       render json: { error: exception.message }
#   end
# #skip_before_filter :authenticate_user!
#
#     helpers do
#       def current_user
#         @current_user ||= User.authorize!(env)
#         #authorize!
#       end
#
#       def authenticate!
#         error!('401 Unauthorized', 401) unless current_user
#       end
#     end
#
#
#     paginate per_page: 2, max_per_page: 100, offset: 5
#     resource :post do
#
#       desc 'Return a posts with paginate. PostsController#index'
#       get do
#         paginate(Post.order("created_at DESC"))
#       end
#
#       desc 'Return a post. PostsController#show'
#       params do
#         requires :id, type: Integer, desc: 'Post id.'
#       end
#       route_param :id do
#         get do
#           Post.find(params[:id])
#         end
#       end
#
#       desc 'Create post. PostsController#create'
#         params do
#           requires :title, type: String, desc: 'Title of post'
#           requires :body, type: String, desc: 'Body of post'
#           requires :rubric_ids, type: Integer, desc: "Ids of Rubric"
#         end
#         post do
#           authenticate!
#           rubrics = []
#           params[:rubric_ids].each {|id| rubrics.push(Rubric.find(id))}
#           post.rubrics << rubrics
#           post = Post.new({
#             user_id: current_user.id,
#             title: params[:title],
#             body: params[:body]
#           })
#           post.rubrics << rubrics
#           post.save
#         end
#
#       paginate per_page: 2, max_per_page: 20, offset: 5
#
#       desc 'Show comments. CommentsController#show'
#
#         params do
#           requires :post_id, type: Integer, desc: 'Post id.'
#         end
#
#         route_param :post_id do
#           resource :comments do
#             get do
#               post = Post.find(params[:post_id])
#               paginate(post.comments)
#             end
#
#             desc 'Create comment. CommentsController#create'
#
#             params do
#               requires :body, type: String, desc: 'Body of Comment'
#             end
#             post do
#              #authenticate!
#               p params[:post_id]
#               post = Post.find(params[:post_id])
#               p post
#               comment = Comment.new({
#                 user_id: 2,
#                 body: params[:body],
#                 post_id: params[:post_id]
#                 })
#               if comment.save
#                 p comment
#               else
#                 p comment.errors
#               end
#             end
#           end
#         end
#     end
#
#     resource :rubrics do
#       desc 'Show rubrics. RubricsController#index'
#       get do
#         Rubric.all
#       end
#
#       desc 'Show rubric with posts. RubricsController#show'
#         params do
#           requires :rubric_id, type: Integer, desc: 'Rubric id.'
#         end
#         route_param :rubric_id do
#           get do
#             rubric = Rubric.find(params[:rubric_id])
#             posts = rubric.posts.order("created_at DESC")
#             paginate(posts)
#           end
#         end
#
#       resource :name do
#         desc 'Get name of Rubric. Rubric'
#         params do
#           requires :rubric_id, type: Integer, desc: 'Rubric id.'
#         end
#         route_param :rubric_id do
#           get do
#            rubric = Rubric.find(params[:rubric_id])
#           end
#         end
#       end
#     end
#
#
# # def index
# #     respond_with Rubric.all
# #   end
#
# #   def show
# #     rubric = Rubric.find(params[:id])
# #     posts = rubric.posts.order("created_at DESC")
# #     max_per_page = 2
# #     paginate posts.count, max_per_page do |limit, offset|
# #       render json: posts.limit(limit).offset(offset)
# #     end
# #   end
#
# #   def name
# #     rubric = Rubric.find(params[:id])
# #     render json: rubric
# #   end
#
#   #     desc 'Return a personal timeline.'
#   #     get :home_timeline do
#   #       authenticate!
#   #       current_user.statuses.limit(20)
#   #     end
#
#   #     desc 'Return a status.'
#   #     params do
#   #       requires :id, type: Integer, desc: 'Status id.'
#   #     end
#   #     route_param :id do
#   #       get do
#   #         Status.find(params[:id])
#   #       end
#   #     end
#
#   #     desc 'Create a .'
#   #     params do
#   #       requires :status, type: String, desc: 'Your status.'
#   #     end
#   #     post do
#   #       authenticate!
#   #       Status.create!({
#   #         user: current_user,
#   #         text: params[:status]
#   #       })
#   #     end
#
#   #     desc 'Update a status.'
#   #     params do
#   #       requires :id, type: String, desc: 'Status ID.'
#   #       requires :status, type: String, desc: 'Your status.'
#   #     end
#   #     put ':id' do
#   #       authenticate!
#   #       current_user.statuses.find(params[:id]).update({
#   #         user: current_user,
#   #         text: params[:status]
#   #       })
#   #     end
#
#   #     desc 'Delete a status.'
#   #     params do
#   #       requires :id, type: String, desc: 'Status ID.'
#   #     end
#   #     delete ':id' do
#   #       authenticate!
#   #       current_user.statuses.find(params[:id]).destroy
#   #     end
#   #   end
#   end
# end