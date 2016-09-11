require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_guest
  create_rubric
  create_post
  let(:json) { JSON.parse(response.body) }

  describe "GET #show" do
    it "returns http success" do
      comment = FactoryGirl.create(:comment)
      get :show, id: comment.post_id
      expect(response).to have_http_status(:success)
    end

    it "Pagination check. We must get two Comments" do
      comments = FactoryGirl.create_list(:comment, 10)
      get :show, id: comments.first.post_id
      expect(json.size).to eq(2)
    end

  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end

    it 'not authorized - not access to create comment!' do
      post :create, format: :json # without arguments
      expect(json["error"]["authorization"]).to eq("You are not authorized to access this page.")
    end

    context 'Create new comment. Authorized user.' do
      login_user
      
      it "Success result. Return new comment" do
        post :create, format: :json, :comment => { body: "TestBody", user_id: "2", post_id: "1" }
        expect(json["body"]).to eq("TestBody") 
        expect(json["post_id"]).to eq(1)
        expect(json["post_id"]).to eq(1)        
      end

      it "Error message if body is empty" do
        post :create, format: :json, :comment => { user_id: "2", post_id: "1" }        
        expect(json["error"]["body"][0]).to eq("can't be blank")
      end
    end
  
  end
end