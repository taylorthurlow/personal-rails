require "rails_helper"

RSpec.describe "Projects" do
  describe "index" do
    it "works" do
      get projects_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "new" do
    it "works" do
      sign_in

      get new_project_path

      expect(response).to have_http_status(:ok)
    end

    it "authorized" do
      get new_project_path

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "edit" do
    it "works" do
      sign_in

      get edit_project_path(create(:project))

      expect(response).to have_http_status(:ok)
    end

    it "authorized" do
      get edit_project_path(create(:project))

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "create" do
    it "works" do
      sign_in

      post projects_path, params: { project: attributes_for(:project) }

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(projects_path)
    end

    it "authorized" do
      post projects_path(build(:project))

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "update" do
    it "works" do
      sign_in
      project = create(:project, name: "A Title")

      patch project_path(project), params: { project: { name: "Another Title" } }

      expect(project.reload.name).to eq "Another Title"
    end

    it "authorized" do
      patch project_path(create(:project)), params: { project: { name: "ASDF" } }

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "destroy" do
    it "works" do
      sign_in

      delete project_path(create(:project))

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(projects_path)
    end

    it "authorized" do
      delete project_path(create(:project))

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_url)
    end
  end
end
