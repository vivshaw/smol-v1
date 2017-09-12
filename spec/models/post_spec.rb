require 'spec_helper'

describe Post do
  it "has a valid factory" do
    FactoryGirl.create(:post).should be_valid
  end

  it "is invalid without a title" do
    FactoryGirl.build(:post, title: nil).should_not be_valid
  end

  it "is invalid without a description" do
    FactoryGirl.build(:post, description: nil).should_not be_valid
  end

  it "is invalid without a user" do
    FactoryGirl.build(:post, user: nil).should_not be_valid
  end

  it "returns the top 3 posts"
end
