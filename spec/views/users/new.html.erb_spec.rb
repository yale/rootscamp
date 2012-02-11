require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :twitter => "MyString",
      :fb_id => "MyString",
      :primary_location_id => ""
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_phone", :name => "user[phone]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_twitter", :name => "user[twitter]"
      assert_select "input#user_fb_id", :name => "user[fb_id]"
      assert_select "input#user_primary_location_id", :name => "user[primary_location_id]"
    end
  end
end
