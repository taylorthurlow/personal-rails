require "rails_helper"

RSpec.describe "Create Post" do
  it "creates a post", js: true do
    visit new_session_path

    login = create(:login, password: "password")

    fill_in "username", with: login.username
    fill_in "password", with: "password"

    click_on "Login"

    find(:xpath, "//a[@href='/posts/new']").click

    fill_in "post_title", with: "Some Post"
    fill_in "post_slug", with: "some-post"
    fill_in "post[all_tags]", with: "tag1, tag2, tag3"
    fill_in "post[contents]", with: "Lorem ipsum dolor amet. I am a little teapot."

    click_on "Preview"
    click_on "Create Post"
  end
end
