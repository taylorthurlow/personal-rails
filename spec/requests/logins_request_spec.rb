require "rails_helper"

RSpec.describe "Logins" do
  describe "create" do
    it "works" do
      sign_in

      post logins_path, params: { login: attributes_for(:login) }

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(posts_path)
    end

    it "authorized" do
      post logins_path(build(:login))

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "update" do
    it "works" do
      sign_in
      login = create(:login, username: "taylor", password: "password")

      patch login_path(login), params: {
                                 login: {
                                   username: "rolyat",
                                   password: "password",
                                 },
                               }

      expect(login.reload.username).to eq "rolyat"
    end

    it "authorized" do
      login = create(:login, username: "taylor", password: "password")

      patch login_path(login), params: {
                                 login: {
                                   username: "rolyat",
                                   password: "password",
                                 },
                               }

      expect(login.reload.username).not_to eq "rolyat"
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "destroy" do
    it "works" do
      sign_in

      delete login_path(create(:login))

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(logins_path)
    end

    it "authorized" do
      delete login_path(create(:login))

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_url)
    end
  end
end
