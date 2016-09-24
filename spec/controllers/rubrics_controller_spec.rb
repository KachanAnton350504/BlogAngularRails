require 'rails_helper'
  # comment = FactoryGirl.create(:comment)
  #     get :show, id: comment.post_id

RSpec.describe RubricsController, type: :controller do
  login_user
  let(:rubrics) { FactoryGirl.build_list(:rubric, 50) }
  let(:json) { JSON.parse(response.body) }
  let(:rubric) { FactoryGirl.create(:rubric) } 
  let(:post) { FactoryGirl.build_list(:post, 10) }


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "Return all(50) rubrics" do
      rubrics.each {  |r| r.save(validate: false)  }
      get :index
      expect(json.size).to eq(50)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :comment_show, id: rubric.id
      expect(response).to have_http_status(:success)
    end

    it "Pagination check. We must get two Posts" do
      id = rubric.id
      posts.each {  |post| post.save(validate: false)  }
      get :comment_show, id: id
      expect(json.size).to eq(2)
    end

    it "Show posts. Sorting by date created." do
       id = rubric.id
       posts.each {  |post| post.save(validate: false)  }      
       get :comment_show, id: id
       expect(json.first["id"]).to eq(10)
       expect(json.second["id"]).to eq(9)
    end  

  end

  describe "GET #name" do
    it "returns http success" do
      get :name, id: rubric.id
      expect(response).to have_http_status(:success)
    end

    it "return valid name of rubric" do
      get :name, id: rubric.id
      expect(json["name"]).to eq("TestRubric")
    end
  end

end
