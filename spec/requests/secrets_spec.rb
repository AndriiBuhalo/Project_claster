require 'rails_helper'




RSpec.describe "Secrets", type: :request do
  describe "GET /index" do
    it "returns http success" do
      login_as(FactoryBot.create(:user))
      expect(request.session[:user_id]).not_to be_nil
      
    end
  end

end
