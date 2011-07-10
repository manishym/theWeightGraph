require 'spec_helper'

describe User do
  before(:each) do
    @valid = {:name => "Manish", :email => "manish@theweightgraph.org", :password => "foobar", :password_confirmation => "foobar"}
  end
  describe "Invalid users" do
    
    it "should not create a user without email" do
      empty_user = User.create(@valid.merge(:email => ""))
      empty_user.should_not be_valid
    end
    it "should not allow spaces in email" do
      spaced_email = User.create(@valid.merge(:email => "man ish@theweightgraph.org"))
      spaced_email.should_not be_valid
    end
    it "should not allow user without domain" do
      no_domain = User.create(@valid.merge(:email => "manish.com"))
      no_domain.should_not be_valid
    end
    it "should not create 2 users with same email" do
      user1 = User.create(@valid)
      user2 = User.create(@valid.merge(:email => "ManIsH@theweightgraph.org"))
      user2.should_not be_valid
    end
    it "should not allow user without password" do
      no_pass = User.create(@valid.merge(:password => ""))
      no_pass.should_not be_valid
    end
    it "Should check for password_confirmation" do
      no_conf = User.create(@valid.merge(:password_confirmation => ""))
      no_conf.should_not be_valid
    end
  end
  describe "valid users" do
    it "should create a valid user" do
      user = User.create!(@valid)
      user.should be_valid
    end
    it "should increase user count" do
      lambda do
        user = User.create!(@valid)
        user.save
      end.should change(User, :count).by(1)   
    end
  end
end
