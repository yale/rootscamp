require 'spec_helper'

describe User do
  def valid_attributes
    VALID_ATTRIBUTES[:user]
  end

  before :each do
    @user = User.create(valid_attributes)
    @friend = Factory :user
  end

  it "accepts valid attributes" do
    @user.should be_valid
  end

  it "requires a name" do
    User.create(valid_attributes.except(:name)).should_not be_valid
  end

  it "has many friends" do
    @user.friends.should == []
  end

  it "has a location" do
    @user.should respond_to(:location)
  end

  it "can set location on create" do
    user = User.create(valid_attributes.merge(:location => Location.create({:city => 'San Andreas'})))
    user.should be_valid
    user.location.city.should == 'San Andreas'
  end

  describe "#friend_request" do
    it "adds a new friend" do
      @user.friend_request(@friend)
      @user.friends.should == [@friend]
    end

    it "adds the reverse relationship" do
      @user.friend_request(@friend)
      @friend.friends.should == [@user]
    end

    it "makes a pending friend request" do
      @user.friend_request(@friend)
      @user.pending_friends.should == [@friend]
    end
    
    it "makes a reverse friend request" do
      @user.friend_request(@friend)
      @friend.friend_requests.should == [@user]
    end
  end

  describe "#accept!" do
    before :each do
      @user.friend_request(@friend)
    end

    it "confirms the friendship" do
      @friend.accept!(@user)
      @user.confirmed_friends.should include(@friend)
    end
  end
end
