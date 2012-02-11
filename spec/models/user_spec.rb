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

  describe "#friend_request" do
    before :each do
      @user = User.create(valid_attributes)
      @friend = Factory :user
    end

    it "adds a new friend" do
      @user.friend_request(@friend)
      @user.friends.should == [@friend]
    end

    it "adds the reverse relationship" do
      @user.friend_request(@friend)
      @friend.friends.should == [@user]
    end
  end
end
