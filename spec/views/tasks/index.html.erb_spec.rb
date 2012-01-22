require 'spec_helper'

describe 'tasks/index.html.erb' do

  before(:each) {
    view.should_receive(:logged_in?).at_least(:once).and_return(true)
    @tasks = assign(:tasks, [mock_model(Task, :id =>1, :body => "a_body")])
    stub_template "tasks/_task.html.erb" => "<%= task.body %><br/>"
  }

  it 'renders page head name' do
    render
    rendered.should have_selector("h1", :content => "Listing Tasks")
  end
  it 'renders link new task' do
    render
    rendered.should have_selector("a", :content => "New task for js", :href => "/tasks/new.js")
  end
  it 'renders link to Agile Labors' do
    render
    rendered.should have_selector("a", :content => "Agile Labors", :href =>"/agile_labors")
  end
  it 'renders recent tasks' do
    render
    rendered.should have_selector("a", :content => "Recent tasks", :href =>"/recent_tasks.js")
  end
  it 'renders early tasks' do
    render
    rendered.should have_selector("a", :content => "Early tasks", :href =>"/early_tasks.js")
  end
  it 'renders new task' do
    render
    rendered.should have_selector("a", :content => "New task", :href => "/tasks/new")
  end
end
