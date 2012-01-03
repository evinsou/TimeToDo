require 'spec_helper'

describe Task do

  before(:each) do
    @task = Task.new(:body => "ommited task")
  end

  it "is valid with valid attributes" do
    @task.should be_valid
  end
  it "is not valid without a body" do
    @task.body = nil
    @task.should_not be_valid
  end

end
