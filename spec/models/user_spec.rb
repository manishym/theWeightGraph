require 'spec_helper'

describe User do
  describe "Invalid users" do
    before(:each) do
      @invalid1 = {:name => "", :email => "", :password => ""}
      @invalid2 = {:name => "", :email => "someone", :password => "value", }
    end
    it "should not create a user without email" do
      empty_user = User.create!(@invalid1)
      empty_user.should_not be_valid
    end
  end
end
