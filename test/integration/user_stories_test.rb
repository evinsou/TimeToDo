require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "multiple users creating an task" do
    eugene = registered_user
    lauren = registered_user
    
    eugene.logs_in 'eugene@example.com', 'secret'
    lauren.logs_in 'lauren@example.com', 'secret'

    eugene.creates_task :body => 'Integration tests'
    lauren.creates_task :body => 'Open Session'
     
    eugene.logs_out
    lauren.logs_out
  end

  private
    def registered_user
      open_session do |user|
        def user.logs_in (email, password)
          get login_path   
        
          assert_response :success
          assert_template 'new'

          post session_path, :email => email, :password => password
  
          assert_response :redirect
          assert_redirected_to root_path

          follow_redirect!

          assert_response :success
          assert_template 'index'  
          assert session[:user_id]
        end
     
        def user.logs_out
          get logout_path

          assert_response :redirect
          assert_redirected_to root_path
          assert_nil session[:user]
  
          follow_redirect!

          assert_template 'index'
        end

        def user.creates_task(task_hash)
          get new_task_path

          assert_response :success
          assert_template 'new'

          post tasks_path, :task => task_hash

          assert assigns(:task).valid?
          assert_response :redirect
          assert_redirected_to task_path(assigns(:task))

          follow_redirect!

          assert_response :success
          assert_template 'show'
        end    
      end
    end
end
