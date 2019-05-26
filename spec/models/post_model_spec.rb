require "rails_helper"

RSpec.describe Post do
  subject(:post) { create(:post) }

  context "when building" do
    it "is valid" do
      expect(build(:post)).to be_valid
    end

    context "with an invalid slug" do
      it "is not valid" do
        expect(build(:post, slug: "SOME-SLUG")).not_to be_valid
        expect(build(:post, slug: "some_slug")).not_to be_valid
        expect(build(:post, slug: "some-slug!")).not_to be_valid
      end
    end

    context "with no title" do
      it "is not valid" do
        expect(build(:post, title: "")).not_to be_valid
      end
    end

    context "with no slug" do
      it "is not valid" do
        expect(build(:post, slug: "")).not_to be_valid
      end
    end

    context "with no contents" do
      it "is not valid" do
        expect(build(:post, contents: "")).not_to be_valid
      end
    end

    context "with a duplicate slug" do
      it "is not valid" do
        create(:post, slug: "some-slug")
        expect(build(:post, slug: "some-slug")).not_to be_valid
      end
    end
  end

  describe "#date_line" do
    context "when the post has not been updated before" do
      it "returns a normal date line" do
        post = create(:post, last_updated: nil)

        expect(post.date_line).not_to include "last updated"
      end
    end

    context "when the post has been updated" do
      it "returns a date line with last updated" do
        post = create(:post, last_updated: Date.today)

        expect(post.date_line).to include "last updated"
      end
    end
  end

  describe "#all_tags" do
    it "returns a string list of all tags" do
      tag1 = create(:tag, name: "one")
      tag2 = create(:tag, name: "two")
      post = create(:post, tags: [tag1, tag2])

      expect(post.all_tags).to eq "one, two"
    end
  end

  describe "#all_tags=" do
    it "sets tags from a comma separated string" do
      post.all_tags = "one, two, three, four"

      expect(post.tags.count).to eq 4
      expect(post.all_tags).to eq "one, two, three, four"
    end
  end

  describe "#generate_markdown_html" do
    it "generates markdown html" do
      expect(post.generate_markdown_html).to be_a String
    end
  end

  describe "tag scope" do
    it "gets a list of posts with a tag" do
      tag = create(:tag)
      create_list(:post, 5, tags: [tag])

      posts = Post.tag(tag.name)
      expect(posts.count).to eq 5
      expect(posts.pluck(:name).uniq).to eq [tag.name]
    end
  end
end
