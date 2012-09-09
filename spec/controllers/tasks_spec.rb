require 'spec_helper'

describe TasksController do

  describe "POST create" do

    before(:each) do
      controller.stub(:authenticate).and_return(true)
      @task = mock_model(Task)
      @tasks = mock_model(Task)
      @current_user = mock_model(User)
      controller.stub(:current_user).and_return(@current_user)
      @current_user.stub(:tasks).and_return(@tasks)
      @current_user.tasks.stub(:new).and_return(@task)
      @task.stub(:save)
    end

    context "user create" do

    end
    it "create user" do
      controller.should_receive(:current_user).and_return(@current_user)
      post :create
    end
    it "assigns tasks to user" do
      @current_user.should_receive(:tasks).and_return(@tasks)
      post :create
    end
    it "create new task on user" do
      @current_user.tasks.should_receive(:new).with("body" => "write tests to cover off most scenarios").and_return(@task)
      post :create, :task => { "body" => "write tests to cover off most scenarios"}
    end

    context "when the task saves successfully" do
      before do
        @task.stub(:save).and_return(true)
      end
      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should eq("Task was successfully created.")
      end
      it "redirects to Task index" do
        post :create
        response.should redirect_to task_path(@task)
      end
    end

    context "when the task fail to save" do
      before do
        @task.stub(:save).and_return(false)
      end
      it "assigns @task" do
        post :create
        assigns[:task].should eq(@task)
      end
      it "renders new template" do
        post :create
        response.should render_template "new"
      end
    end
  end

  describe "GET show" do
    it 'shows created product' do
      task = mock_model(Task, :id => 1)
      Task.should_receive(:find).with("1").and_return(task)
      get :show, :id => 1
    end
  end

  describe "GET index" do
    it "show all products renders index page" do
      tasks = mock_model(Task)
      Task.should_receive(:order).with('tasks.position ASC').and_return(tasks)
      get :index
    end
    it "renders index page" do
      get :index
      response.should render_template("index")
    end
    it "assigns all products to index page" do
      tasks = mock_model(Task)
      assigns[:products].should eq(@products)
      get :index
    end
  end

  describe "GET new" do
    it "assigns new task" do
      controller.stub(:authenticate).and_return(true)
      task = mock_model(Task)
      Task.should_receive(:new).and_return(task)
      get :new
    end
    it "renders new task page" do
      controller.stub(:authenticate).and_return(true)
      task = mock_model(Task)
      Task.stub(:new).and_return(task)
      get :new
      response.should render_template ("new")
    end
  end

  describe "GET edit" do
    before do
      controller.stub(:authenticate).and_return(true)
      @task = mock_model(Task, :id => 1)
      @tasks = mock_model(Task)
      @current_user = mock_model(User)
      controller.stub(:current_user).and_return(@current_user)
      @current_user.stub(:tasks).and_return(@tasks)
      @current_user.tasks.stub(:find).and_return(@task)
    end
    it "finds task to edit" do
      @current_user.tasks.should_receive(:find).with("1").and_return(@task)
      get :edit, :id => @task
    end
    it "renders edit page" do
      get :edit, :id => @task
      response.should render_template("edit")
    end
    it "assigns @task to view" do
      get :edit, :id => 1
      assigns[:task].should eq(@task)
    end
  end

  describe "PUT update" do

    before(:each) do
      controller.stub(:authenticate).and_return(true)
      @task = mock_model(Task)
      @tasks = mock_model(Task)
      @current_user = mock_model(User).as_null_object
      controller.stub(:current_user).and_return(@current_user)
      @current_user.tasks.stub(:find).and_return(@task)
    end

    it "finds task" do
      @task.stub(:update_attributes).and_return(true)
      @current_user.tasks.should_receive(:find).and_return(@task)
      put :update, :id => 1
    end

    context "when updates successfully" do
      before(:each) do
        @task.stub(:update_attributes).and_return(true)
      end
      it "updates task" do
        @task.should_receive(:update_attributes).and_return(true)
        put :update, :id => 1
      end
      it "message about successfully" do
        put :update, :id => 1
        flash[:notice].should eq("Task was successfully updated.")
      end
      it "redirects to task page" do
        put :update, :id => 1
        response.should redirect_to @task
      end
    end

    context "when fails to update" do
      before(:each) do
        @task.stub(:update_attributes).and_return(false)
      end
      it "assigns task to edit page" do
        put :update, :id => 21
        assigns[:task].should eq(@task)
      end
      it "redirects back to product page" do
        put :update, :id => 21
        response.should render_template "edit"
      end
    end

  end

  describe "DELETE destroy" do
    before(:each) do
      controller.stub(:authenticate).and_return(true)
      @task = mock_model(Task)
      @tasks = mock_model(Task)
      @current_user = mock_model(User).as_null_object
      controller.stub(:current_user).and_return(@current_user)
      @current_user.tasks.stub(:find).and_return(@task)
    end
    it "finds a product" do
      @current_user.tasks.should_receive(:find).and_return(@task)
      delete :destroy, :id => 1
    end
    it "destroys product" do
      @task.should_receive(:destroy)
      delete :destroy, :id => 1
    end
    it "redirects to main page" do
      delete :destroy, :id => 1
      response.should redirect_to :action => "index"
    end
  end

end

