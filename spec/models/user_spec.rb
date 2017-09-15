require 'spec_helper'

describe User do

  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  describe "validations" do
    it "is invalid without an email" do
      expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
    end

    it "is invalid without a password" do
      expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
    end

    it "is invalid without a username" do
      expect(FactoryGirl.build(:user, username: nil)).not_to be_valid
    end

    it "is invalid without a description" do
      expect(FactoryGirl.build(:user, description: nil)).not_to be_valid
    end

    it "is invalid without a colortheme" do
      expect(FactoryGirl.build(:user, colortheme: nil)).not_to be_valid
    end

    it "requires a unique email" do
      email = "test@example.com"
      expect(FactoryGirl.create(:user, email: email)).to be_valid
      expect(FactoryGirl.build(:user, email: email)).not_to be_valid
    end

    it "requires a unique username" do
      username = "test_user"
      expect(FactoryGirl.create(:user, username: username)).to be_valid
      expect(FactoryGirl.build(:user, username: username)).not_to be_valid
    end
  end

  describe "methods" do
    it "returns an array of colors from its colortheme" do
      user = FactoryGirl.create(:user)
      colortheme =  user.get_colortheme
      expect(colortheme.length).to eq(3)
      expect(colortheme).to include(:primary, :lighter, :accent)
    end
  end

end
