require 'spec_helper'

describe "Users" do
  describe "GET /users.json" do
    it "works!" do
      get users_path, :format => :json
      response.status.should == 200
    end
  end

  describe "GET /users/:id.json" do
    it "returns 404 if user does not exist" do
      User.stub(:find).and_raise(ActiveRecord::RecordNotFound)
      get user_path(1), :format => :json
      response.status.should == 404
    end

    it "works!" do
      Factory.create :user
      get user_path(1), :format => :json
      response.status.should == 200
    end
  end

  describe "POST /users.json" do

  end

  describe "PUT /users/:id.json" do

  end

  describe "DELETE /users/:id.json" do

  end
end
