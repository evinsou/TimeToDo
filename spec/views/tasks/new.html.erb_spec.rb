require 'spec_helper'

describe 'tasks/new.html.erb' do

  let!(:task) {mock_model("Task")}
  before {assign(:task, task)}

  it 'renders page name' do
    render
    rendered.should have_selector('h1', :content => 'New task')
  end

  it "renders a form to submit a task" do
    render
    rendered.should have_selector("form",
      :method => "post",
      :action => tasks_path,
    ) do |form|
      form.should have_selector("input", :type => "submit")
    end
  end

  it "renders a text field for task body" do
    task.stub(:body => "the body")
    render
    rendered.should have_selector("form",
      :method => "post",
      :action => tasks_path,
    ) do |form|

      form.should have_selector("label",
        :for => "task_body"
      )
      form.should have_selector("input",
        :type => "text",
        :name => "task[body]",
        :value => "the body"
     )
    end
  end
#ggg
  it "renders a select input for the start in time" do
    render
    rendered.should have_selector("form",
      :method => "post",
      :action => tasks_path,
    ) do |form|
      form.should have_selector("label",
        :for => "task_start_in",
        :content => "Start in"
      )
      form.should have_selector("select",
        :id=>"task_start_in_3i",
        :name=>"task[start_in(3i)]"
      )
      form.should have_selector("select",
        :id=>"task_start_in_2i",
        :name=>"task[start_in(2i)]"
      )
      form.should have_selector("select",
        :id=>"task_start_in_1i",
        :name=>"task[start_in(1i)]"
      )
    end
  end

  it "renders a select input for finish by time" do
    render
    rendered.should have_selector("form",
      :method => "post",
      :action => tasks_path,
    ) do |form|
      form.should have_selector("label",
        :for => "task_finish_by",
        :content => "Finish by"
      )
      form.should have_selector("select",
        :id=>"task_finish_by_3i",
        :name=>"task[finish_by(3i)]"
      )
      form.should have_selector("select",
        :id=>"task_finish_by_2i",
        :name=>"task[finish_by(2i)]"
      )
      form.should have_selector("select",
        :id=>"task_finish_by_1i",
        :name=>"task[finish_by(1i)]"
      )
    end
  end

  it "renders a submit button" do
    render
    rendered.should do |form|
      form.should have_selector("input",
        :id => "task_submit",
        :type => "submit",
        :name => "commit",
        :value => "Create task"
      )
    end
  end
end

