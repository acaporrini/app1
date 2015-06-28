require 'rails_helper'

describe UsersController, type: :controller do 

  describe "GET #index" do
    before do
      @user = build(:user)
      sign_in @user
    end
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
  describe "GET #show" do
    before do
      @user = create(:user)
      sign_in @user 
    end
    it "responds successfully with an HTTP 200 status code" do
      get :show, id: @user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the index template" do
      get :show, id: @user.id
      expect(response).to render_template("show")
    end
  end
end