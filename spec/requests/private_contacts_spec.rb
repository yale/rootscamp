require 'spec_helper'

describe "PrivateContacts" do
  def valid_attributes
    VALID_ATTRIBUTES[:user]
  end

  before :each do
    @user = Factory :user
    @private_contact = Factory :private_contact
    @user.private_contacts << @private_contact
    User.stub(:find).and_return(@user)
  end

  describe "GET /users/:user_id/private_contacts.json" do

    def do_get
      get user_private_contacts_path(@user, @private_contact), format: :json
    end

    it "finds the user" do
      User.should_receive(:find).with(@user.id.to_s)
      do_get
    end

    it "finds the user's private contacts" do
      @user.should_receive(:private_contacts).and_return([@private_contact])
      do_get
    end

    it "returns a json array of the user's private contacts" do
      do_get
    end
  end
end
