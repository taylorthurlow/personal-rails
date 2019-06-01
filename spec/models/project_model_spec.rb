require "rails_helper"

RSpec.describe Project do
  subject(:project) { create(:project) }

  context "when building" do
    it "is valid" do
      expect(build(:project)).to be_valid
    end

    context "when name is not present" do
      it "is not valid" do
        expect(build(:project, name: "")).not_to be_valid
      end
    end

    context "when name is not unique" do
      it "is not valid" do
        create(:project, name: "My Project")
        expect(build(:project, name: "My Project")).not_to be_valid
      end
    end

    context "when description is not present" do
      it "is not valid" do
        expect(build(:project, description: "")).not_to be_valid
      end
    end
  end
end
