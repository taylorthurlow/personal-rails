require "rails_helper"

RSpec.describe Tag do
  subject(:tag) { create(:tag) }

  context "when building" do
    it "is valid" do
      expect(build(:tag)).to be_valid
    end

    context "when name is not present" do
      it "is not valid" do
        expect(build(:tag, name: "")).not_to be_valid
      end
    end

    context "when name is not unique" do
      it "is not valid" do
        create(:tag, name: "some-tag")
        expect(build(:tag, name: "some-tag")).not_to be_valid
      end
    end
  end

  describe "with_content scope" do
    it "gets a list of tags with at least a post" do
      tag1 = create(:tag, :with_posts)
      tag2 = create(:tag, :with_posts)
      tag3 = create(:tag)

      tags = Tag.with_content
      expect(tags.count).to eq 2
      expect(tags.pluck(:name)).to eq [tag1.name, tag2.name]
    end
  end
end
