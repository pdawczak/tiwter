require 'spec_helper'

describe User do
  subject(:user) { build(:user) }

  it "has a valid factory" do
    expect(user).to be_valid
  end

  describe "#username" do
    it "has a username" do
      user.username = "sampler"
      expect(user.username).to eq "sampler"
    end

    it "is unique" do
      first = create(:user, username: "tester")
      second = build(:user, username: "tester")

      expect(second).to be_invalid
    end
  end
end
