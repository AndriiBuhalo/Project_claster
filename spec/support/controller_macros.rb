module ControllerMacros
  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Device.mappings[:admin]
  #     sign_in FactoryBot.create(:admin)
  #   end
  # end

  # def login_user
  #   before(:each) do
  #     @request.env["devise.mapping"] = Device.mappings[:user]
  #     user = FactoryBot.create(:user)
  #     sign_in user
  #   end
  # end

  def login_as_admin
    admin = FactoryBot.create(:user_admin)
    login_as(admin)
  end

  def login_as(user)
    request.session[:user_id] = user.id
  end
end