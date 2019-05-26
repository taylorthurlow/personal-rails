require "rails_helper"

RSpec.describe Login do
  subject(:login) { create(:login) }

  context "when building" do
    it "is valid" do
      expect(build(:login)).to be_valid
    end

    context "when username is not present" do
      it "is not valid" do
        expect(build(:login, username: "")).not_to be_valid
      end
    end

    context "when username is not unique" do
      it "is not valid" do
        create(:login, username: "taylor")
        expect(build(:login, username: "taylor")).not_to be_valid
      end
    end

    context "when username is not at least 1 character" do
      it "is not valid" do
        expect(build(:login, username: "a")).not_to be_valid
      end
    end

    context "when password is not present" do
      it "is not valid" do
        expect(build(:login, password: "")).not_to be_valid
      end
    end

    context "when password is not at least 8 characters" do
      it "is not valid" do
        expect(build(:login, password: "1234567")).not_to be_valid
      end
    end
  end
end
