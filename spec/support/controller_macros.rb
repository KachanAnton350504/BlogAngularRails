module ControllerMacros
  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:admin]
  #     sign_in FactoryGirl.create(:admin) # Using factory girl as an example
  #   end
  # end

  def create_post
    before(:each) do
      post =  FactoryGirl.create(:post)
      post
    end
  end


  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end

  def login_guest
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      guest = FactoryGirl.create(:user)
      guest.role = "guest"
      guest.email = "guest@mail.ru"
      guest.save
      sign_in guest
    end
  end
  # def login_guest
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:user]
  #     user = FactoryGirl.create(:guest)
  #     sign_in user
  #   end
  # end
end