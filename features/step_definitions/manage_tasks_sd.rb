Given /^logged in user$/ do
  @user = User.create!(:email => 'zach@mailsen.com', :password => '1234')
end

Given /^no tasks and add task link on main page and new task form$/ do  
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

Given /^existing task for edit$/ do
  @task = Task.create!(:body => 'find text about spring flowers')
end
When /^I choose task to update and changes fields with new values and click update$/ do
  click_on 'find text about spring flowers'
  fill_in 'Body', :with => "find text about spring flowers and it pictures"
end
Then /^I see page with updated task values$/ do
  page.should have_content("find text about spring flowers and their pictures")
end