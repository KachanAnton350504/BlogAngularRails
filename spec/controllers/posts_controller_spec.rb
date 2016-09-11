require 'rails_helper'


RSpec.describe PostsController, type: :controller do
  login_guest

  let(:json) { JSON.parse(response.body) }
  let(:posts) { FactoryGirl.build_list(:post, 10) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "Pagination check. We must get two Posts" do
      posts.each {  |post| post.save(validate: false)  }
      get :index
      expect(json.size).to eq(2)
    end

    it "Show posts. Sorting by date created." do
      posts.each {  |post| post.save(validate: false)  }      
      get :index
      expect(json.first["id"]).to eq(10)
      expect(json.second["id"]).to eq(9)
    end  
  end

  describe "GET #show" do
    it "returns http success" do
      post = Post.create(title: "dsad", body: "3213", user_id: "fds")
      get :show, id: post.id
      expect(response).to have_http_status(:success)
    end

    it "returns valid data" do
      post = Post.create(title: "dsad", body: "3213", user_id: "fds")
      get :show, id: post.id
      expect(json["id"]).to eq(post.id)
    end
  end

  describe "POST #create" do
    
    it 'not authorized - not access to create post!' do
      post :create, format: :json # without arguments
      expect(json["error"]).to eq("You are not authorized to access this page.")
    end
    
    context 'Create new post. Authorized user.' do
      login_user
      
       it "Success result. Return new Post" do
        rubric = FactoryGirl.create(:rubric)
        post :create, format: :json, :post => {rubric_ids: [rubric.id], title: "TestTitle", body: "TestBody", user_id: "2"}
        expect(json["body"]).to eq("TestBody")
        expect(json["title"]).to eq("TestTitle")
        expect(json["user_id"]).to eq(2)        
      end

      it "Error message if title is empty" do
        rubric = FactoryGirl.create(:rubric)
        post :create, format: :json, :post => {rubric_ids: [rubric.id], body: "TestBody", user_id: "2"}
        expect(json["title"][0]).to eq("can't be blank")
      end

      it "Error message if body is empty" do
        rubric = FactoryGirl.create(:rubric)
        post :create, format: :json, :post => {rubric_ids: [rubric.id], title: "TestTitle", user_id: "2"}
        expect(json["body"][0]).to eq("can't be blank")
      end

      it "Error message if rubric_ids is empty" do
        rubric = FactoryGirl.create(:rubric)
        post :create, format: :json, :post => { title: "TestTitle", body: "TestBody", user_id: "2"}
        expect(json["name"][0]).to eq("can't be blank")
      end

      it "Error message if body and title are empty" do
        rubric = FactoryGirl.create(:rubric)
        post :create, format: :json, :post => { rubric_ids: [rubric.id], user_id: "2"}
        expect(json["body"][0]).to eq("can't be blank")
        expect(json["title"][0]).to eq("can't be blank")
      end
    end    
  end
end
