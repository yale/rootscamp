require 'spec_helper'

describe User do
  def valid_attributes
    VALID_ATTRIBUTES[:user]
  end

  before :each do
    @user = User.create(valid_attributes)
    @other = Factory :user
  end

  it "accepts valid attributes" do
    @user.should be_valid
  end

  it "requires a first name" do
    User.create(valid_attributes.except(:first_name)).should_not be_valid
  end

  it "requires a last name" do
    User.create(valid_attributes.except(:last_name)).should_not be_valid
  end

  it "has many private_contacts" do
    @user.private_contacts.should == []
  end

  it "has a location" do
    @user.should respond_to(:raw_location)
  end

  describe "#contact!" do
    it "adds a new private_contact" do
      @user.add_contact!(@other)
      @user.private_contacts.map(&:contact_user).should == [@other]
    end
  end

  describe "#has_contact?" do
    it "returns false if not a contact" do
      @user.has_contact?(@other).should be_false
    end

    it "returns true if is a contact" do
      @user.add_contact!(@other)
      @user.has_contact?(@other).should be_true
    end
  end
end
