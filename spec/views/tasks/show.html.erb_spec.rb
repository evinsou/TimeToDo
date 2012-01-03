require 'spec_helper'

describe "tasks/show.html.erb" do
  #create mock task object with two fields to simulate real obiect
  #as_null_object ignores method that do not wait
  let(:task) do
    mock_model("Task", :id => '1', :body => 'to test show template').as_null_object
  end

  before(:each) do
    assign(:task, task)
    view.stub(:current_user).and_return(true)
  end

 # it "renders" do
 #   render
 #   rendered.should
 # end
  it "renders link to edit" do  
    render
    rendered.should have_selector("a", :href => '/tasks/1/edit')
  end
  it "renders link to delete" do
    render
    rendered.should have_selector("a", :href =>'/tasks/1')
  end
 it "renders back link" do
    render
    rendered.should have_selector("a", :href =>'/tasks')
  end

end
