require "rails_helper"

RSpec.describe "Posts" do
  describe "index" do
    it "works" do
      get posts_path

      expect(response).to have_http_status(:ok)
    end

    context "when a tag param is provided" do
      it "gets posts with only that tag" do
        tag = create(:tag)
        create_list(:post, 5, tags: [tag])

        get posts_path, params: { tag: tag.name }
      end
    end
  end

  describe "archive" do
    it "works" do
      sign_in

      get archive_path

      expect(response).to have_http_status(:ok)
    end

    it "authorizes" do
      get archive_path

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "show" do
    it "works" do
      post = create(:post)

      get post_path(post)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "markdown" do
    it "works" do
      sign_in

      headers = { "Content-Type" => "application/x-www-form-urlencoded" }
      post markdown_path, params: "render me", headers: headers

      expect(response).to have_http_status(:ok)
    end

    it "authorized" do
      headers = { "Content-Type" => "application/x-www-form-urlencoded" }
      post markdown_path, params: "render me", headers: headers

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "new" do
    it "works" do
      sign_in

      get new_post_path

      expect(response).to have_http_status(:ok)
    end

    it "authorized" do
      get new_post_path

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "edit" do
    it "works" do
      sign_in

      get edit_post_path(create(:post))

      expect(response).to have_http_status(:ok)
    end

    it "authorized" do
      get edit_post_path(create(:post))

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "create" do
    it "works" do
      sign_in

      post posts_path, params: { post: attributes_for(:post) }

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(Post.last)
    end

    it "authorized" do
      post posts_path(build(:post))

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "update" do
    it "works" do
      sign_in
      post = create(:post, title: "A Title")

      patch post_path(post), params: { post: { title: "Another Title" } }

      expect(post.reload.title).to eq "Another Title"
    end

    it "authorized" do
      patch post_path(create(:post)), params: { post: { title: "ASDF" } }

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "destroy" do
    it "works" do
      sign_in

      delete post_path(create(:post))

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(posts_path)
    end

    it "authorized" do
      delete post_path(create(:post))

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_session_url)
    end
  end
end
