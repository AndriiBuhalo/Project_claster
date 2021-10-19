require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context "GET /index" do
    it 'returns a success responce' do
      get :index
      expect(response.status).to eq(200) # response.success? та сама лінійка що і в коменті
    end
  end

  # describe "GET #index" do
  #   before do
  #     get :index
  #   end

  #   it
  # end

  context "GET /show" do
    it 'returns a success responce' do
      user = User.create!(name: 'Anton', email: 'anton@gmail.com')
      get :show, params: {id: user.to_param}
      # binding.pry
      expect(response.status).to eq(200)
      # expect(response).to be_success # response.success?
    end
  end

end