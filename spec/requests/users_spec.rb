require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context "GET /index" do
    it 'returns a success responce' do
      get :index
      expect(response).to be_successful # response.success? та сама лінійка що і в коменті
    end
  end
  
  context "GET /show" do
    it 'returns a success responce' do
      user = User.create!(name: 'Anton', email: 'anton@gmail.com')
      get :show, params: {id: user.to_param}
      expect(response.status).to eq(200)
    end
  end

  context "GET /new" do
    it "assigns a new category as @user" do
      # get :new, params: { }, session: valid_session
      # binding.pry
      # expect(assigns(:user)).to be_a_new(User)
    end
  end

  before(:each) do
    @user = User.create(name: Faker::Name.first_name, email:"helo@gmail.com")
  end

  describe "creation" do
    it "should have one item after creation" do
      expect(User.all.count).to eq(1)
    end

    describe "GET /edit" do
      it 'id mast be not null' do
        expect(@user.id).should_not be_nil
      end
    end
  end
end
# binding.pry