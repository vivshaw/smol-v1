require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  it "is invalid without a password" do
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end

  it "returns an array of colors from its colortheme" do
    user = FactoryGirl.create(:user)
    colortheme =  user.get_colortheme
    expect(colortheme.length).to eq(3)
    expect(colortheme).to include(:primary, :lighter, :accent)
  end
end
