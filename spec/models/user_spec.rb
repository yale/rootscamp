require 'spec_helper'

describe User do
  def valid_attributes
    VALID_ATTRIBUTES[:user]
  end

  it "accepts valid attributes" do
    User.create(valid_attributes).should be_valid
  end

  it "requires a name" do
    User.create(valid_attributes.except(:name)).should_not be_valid
  end

  it "requires an email address" do
    User.create(valid_attributes.except(:email)).should_not be_valid
  end

  it "has many friends" do
    user = User.create(valid_attributes)
    user.friends.should == []
  end

  describe "#request" do
    it "adds a new friend" do
      user = User.create(valid_attributes)
      friend = Factory :user
      user.request(friend)
      user.friends.should == [friend]
    end
  end
end
