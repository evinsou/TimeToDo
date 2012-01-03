require 'spec_helper'

describe TasksController do
  describe "POST create" do
=begin     let(:task) {mock_model(Task).as_null_object}

    before(:each) do
      Task.stub(:new).and_return(task)
    end
=end
    it "create new task" do      
      task = mock_model(Task)
      controller.stub(:current_user).and_return(true)
      current_user.tasks.should_receive(:new).with("title" => "a quick brown fox").and_return(task)
      post :create, :task => { "body" => "write tests to cover off most scenarios" }
    end

=begin    context "when the task saves successfully" do
      before do
        task.stub(:save).and_return(true)
      end
      it "sets a flash[:notice] message" do
        post :create
        [:notice].should eq("The task was saved successfully")
      end
      it "redirects to Task index" do
        post :create
        response.should redirect_to :action => "index"
      end      
    end

    context "when the task fail to save" do
      before do
        task.stub(:save).and_return(false)
      end
      it "assigns @task" do
        post :create
        assigns[:task].should eq(task)
      end
      it "renders new template" do
        post :create        
        response.should render_template "new"
      end
    end
=end
  end
  
=begin  describe "GET show" do
  #  let(:product) {mock_model(Product).as_null_object}    

    it 'shows created product' do
      task = mock_model(Task)
     
      Task.should_receive(:find).with(product).and_return(task)# does @ sign stay here or not
      
      get :show, :id => task
    end
  end

  describe "GET index" do
    it "show all products renders index page" do
      tasks = mock_model(Task)
      Task.should_receive(:all).and_return(tasks)
#      response.should render_template("index")
      get :index
    end

    it "assigns all products to index page" do#?
   #   products = mock_model("Product")
    #  assigns[:products].should eq(@products)
    #  get :index
    end
  end

  describe "GET new" do
    it "assigns new page" do
      task = mock_model(Task)
      Task.should_receive(:new).and_return(task)
      
      #response.should render_template ("new")
      get :new
    end
  end

  describe "GET edit" do
    it "renders edit page" do#? name
      task = mock_model(Task)
      Task.should_receive(:find).with(task).and_return(task)
      #response.should render_template("edit")
      get :edit, :id => task
    end

    it "assigns @product to view" do#?
      task = mock_model(Task)

      assigns[:task].should eq(@task)
      get :edit, :id => task.id
    end
  end  

  describe "PUT update" do
    let(:product) {mock_model(Task).as_null_object}

    before(:each) do
      Task.stub(:find).and_return(task)      
    end

    it "finds product" do      
#      product = mock_model(Product)      
      Task.should_receive(:find).with(21).and_return(task)
#      product.stub(:update_attributes).and_return(true)  
      put :update, :id => 21
    end

    context "when updates successfully" do
      before(:each) do
        task.stub(:update_attributes).and_return(true)
      end
      it "updates product values" do
#      product = mock_model(Product)
#      Product.stub(:find).and_return(product)
        task.should_receive(:update_attributes).and_return(true)
        put :update, :id => 21
      end
  #  it "message about successfully" do
  #    put :update, :id => 21
  #    notice.should eq("product updated")
  #  end
      it "redirects to product page" do
#      product = mock_model(Product)
#      Product.stub(:find).with(21).and_return(product)
#      product.stub(:update_attributes).and_return(true)
        put :update, :id => 21
        response.should redirect_to task
      end
    end
    context "when fails to update" do
      before(:each) do
        task.stub(:update_attributes).and_return(false)
      end
      it "redirects back to product page" do
        put :update, :id => 21        
        response.should render_template "edit"
      end
      it "shows error message" do
        put :update, :id => 21
        flash[:alert].should eq("some errors have been occur")
      end
    end
  end

  describe "DELETE destroy" do
    it "finds a product" do
      task = mock_model(Task).as_null_object
      Task.should_receive(:find).and_return(task)
      delete :destroy, :id => 21
    end
    it "destroys product" do
      task = mock_model(Task).as_null_object
      Task.stub(:find).and_return(task)
      task.should_receive(:destroy)
      delete :destroy, :id => 21
    end
    it "redirects to main page" do
      task = mock_model(Task).as_null_object
      Task.stub(:find).and_return(task)
      delete :destroy, :id => 21
      response.should redirect_to :action => "index"
    end
  end
=end
end
