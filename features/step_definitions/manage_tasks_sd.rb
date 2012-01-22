Given /^logged in user$/ do
  @user = User.create!(:id => 1,:email => 'zach@mailsen.com', :password => '1234')
  #@session = Session.create! :user_id => @user.id 
  #session[:user_id] = user.id
end

And /^no tasks and add task link on main page and new task form$/ do  
  visit tasks_path  
  click_on "New task"
end

When /^I write new task with valid fields and selects$/ do  

  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => @user.password
  click_button 'Login' 
  click_on 'New task'
  fill_in 'Body', :with => "cook supper to evening"

  select "October", :from => "task_finish_by_2i"
  select "10", :from => "task_finish_by_3i"
  select "2011", :from => "task_finish_by_1i"

  select "October", :from => "task_start_in_2i"
  select "10", :from => "task_start_in_3i"
  select "2011", :from => "task_start_in_1i"

  click_button "Create Task"
end

Then /^I should be on the tasks list page and see new record$/ do
  page.should have_content('cook supper to evening')
end

Given /^existing task for delete$/ do
  @task = Task.create!(:id => 1, 
                       :user_id => 1, 
                       :body => 'find text about spring flowers', 
                       :start_in => "#{Time.parse("05-07-2009 19:00")}", 
                       :finish_by => Time.parse("05-08-2009 19:00"))
end
When /^goes on task page and click delete$/ do
  visit '/login'
  fill_in 'Email',  :with => @user.email
  fill_in 'Password', :with => @user.password
  click_button 'Login'
  click_link 'find text about spring flowers'
  click_link 'Delete'
end
Then /^shows main page without task have been deleted$/ do
  page.should have_content"Task deleted"  
  page.should_not have_content('find text about spring flowers')
end
