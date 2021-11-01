 require 'rails_helper'



RSpec.describe "/microposts", type: :request do
  
  
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Micropost.create! valid_attributes
      get microposts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      micropost = Micropost.create! valid_attributes
      get micropost_url(micropost)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_micropost_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      micropost = Micropost.create! valid_attributes
      get edit_micropost_url(micropost)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Micropost" do
        expect {
          post microposts_url, params: { micropost: valid_attributes }
        }.to change(Micropost, :count).by(1)
      end

      it "redirects to the created micropost" do
        post microposts_url, params: { micropost: valid_attributes }
        expect(response).to redirect_to(micropost_url(Micropost.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Micropost" do
        expect {
          post microposts_url, params: { micropost: invalid_attributes }
        }.to change(Micropost, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post microposts_url, params: { micropost: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested micropost" do
        micropost = Micropost.create! valid_attributes
        patch micropost_url(micropost), params: { micropost: new_attributes }
        micropost.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the micropost" do
        micropost = Micropost.create! valid_attributes
        patch micropost_url(micropost), params: { micropost: new_attributes }
        micropost.reload
        expect(response).to redirect_to(micropost_url(micropost))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        micropost = Micropost.create! valid_attributes
        patch micropost_url(micropost), params: { micropost: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested micropost" do
      micropost = Micropost.create! valid_attributes
      expect {
        delete micropost_url(micropost)
      }.to change(Micropost, :count).by(-1)
    end

    it "redirects to the microposts list" do
      micropost = Micropost.create! valid_attributes
      delete micropost_url(micropost)
      expect(response).to redirect_to(microposts_url)
    end
  end
end
