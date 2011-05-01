require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:first_task)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    login_as(:eugene)
    get :new
    assert_response :success
  end

  test "should create task" do
    login_as(:eugene)
    assert_difference('Task.count') do
      post :create, :task => {:body => 'Post a test'}
    end
    
    assert_response :redirect
    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, :id => @task.to_param

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:task)
    assert assigns(:task).valid?
  end

  test "should get edit" do
    login_as(:eugene)
    get :edit, :id => @task.to_param
    assert_response :success
  end

  test "should update task" do
    login_as(:eugene)
    put :update, :id => @task.to_param, :task => {:body => 'New task'}
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    login_as (:eugene)
    assert_nothing_raised {Task.find(@task.to_param)}

    assert_difference('Task.count', -1) do
      delete :destroy, :id => @task.to_param
    end

    assert_response :redirect
    assert_redirected_to tasks_path
    
    assert_raise(ActiveRecord::RecordNotFound) { Task.find(@task.to_param) }
  end
end
