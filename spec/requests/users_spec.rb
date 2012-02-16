require 'spec_helper'

describe "Users" do
  def valid_attributes
    VALID_ATTRIBUTES[:user]
  end

  before :each do
    @user = Factory.create :user
  end
  
  describe "GET /users.json" do
    it "works!" do
      get users_path, :format => :json
      response.status.should == 200
    end
  end

  describe "GET /users/:id.json" do
    def do_get
      get user_path(@user), :format => :json
    end

    it "returns 404 if user does not exist" do
      User.stub(:find).and_raise(ActiveRecord::RecordNotFound)
      do_get
      response.status.should == 404
    end

    it "works!" do
      do_get
      response.status.should == 200
    end

    it "includes the user's name" do
      do_get
      JSON.parse(response.body)["first_name"].should == @user.first_name
      JSON.parse(response.body)["last_name"].should == @user.last_name
    end

    it "includes the user's company" do
      do_get
      JSON.parse(response.body)["company"].should == @user.company
    end

    it "includes the user's phone number" do
      do_get
      JSON.parse(response.body)["phone"].should == @user.phone
    end

    it "includes the user's raw location" do
      do_get
      JSON.parse(response.body)["raw_location"].should == @user.raw_location
    end

    it "includes the user's latitude and longitude" do
      do_get
      JSON.parse(response.body)["lat"].should == @user.lat
      JSON.parse(response.body)["long"].should == @user.long
    end

    it "includes the user's twitter and facebook IDs" do
      do_get
      JSON.parse(response.body)["twitter"].should == @user.twitter
      JSON.parse(response.body)["fb_id"].should == @user.fb_id
    end
  end

  describe "POST /users.json" do
    it "accepts valid attributes" do
      post users_path, :format => :json, :user => valid_attributes
      response.status.should == 201
    end
  end

  describe "PUT /users/:id.json" do
    def do_put parameters
      put user_path(@user.id), parameters, format: :json
    end

    it "accepts valid attributes" do
      do_put user: { email: "foo@bar.com" }
      response.status.should == 204
      User.find(@user.id).email.should == "foo@bar.com"
    end
  end

  describe "DELETE /users/:id.json" do
    it "deletes a user record" do
      delete user_path(@user.id)
      lambda { User.find(@user.id) }.should raise_error ActiveRecord::RecordNotFound
    end

  end
end
