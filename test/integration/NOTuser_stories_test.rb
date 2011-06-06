require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "should login create task user and logout user" do
    #Login
    get login_path
  
    assert_response :success
    assert_template 'new'

    post session_path, :email => 'eugene@example.com', :password => 'secret'
    
    assert_response :redirect
    assert_redirected_to root_path

    follow_redirect!

    assert_response :success
    assert_template 'index'
    assert session[:user_id] 
    
    #Create New Task  
    get new_task_path

    assert_response :success
    assert_template 'new'

    post tasks_path, :task => {:body => 'New integration task'}

    assert assigns(:task).valid?
    assert_response :redirect
    assert_redirected_to task_path(assigns(:task))

    follow_redirect!

    assert_response :success
    assert_template 'show'

    #Logout
    get logout_path

    assert_response :redirect
    assert_redirected_to root_path
    assert_nil session[:user_id]
    
    follow_redirect!
  
    assert_template 'index'
  end
end
