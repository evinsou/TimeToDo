require 'spec_helper'

describe User do

  before(:each) do
    @user = User.new(:email => "main@example.com",
                     :password => "secret")
 #   @luk = User.build(:email => "luk@example.com",
  #                  :password => 'guessit')
  end

  it "is valid with valid attributes" do
    @user.should be_valid
  end
  it "is not valid without a email" do
    @user.email = nil
    @user.should_not be_valid
  end
  it "is not valid without a password" do
    @user.password = nil
    @user.should_not be_valid
  end
  it "is not valid if password shorter than 5" do
    @user.password = "omi"
    @user.should_not be_valid
  end
=begin  it "is not valid with already email" do
    @user.email = "luk@example.com"
    @user.should_not be_valid
  end
  it "is not valid without a body" do
    @user.email = nil
    @user.should_not be_valid
  end
  it "is not valid without a body" do
    @user.email = nil
    @user.should_not be_valid
  end
=end
end
