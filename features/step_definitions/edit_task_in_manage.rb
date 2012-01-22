And /^existing task for edit$/ do
  @task = Task.create!(:id => 1, 
                       :user_id => 1, 
                       :body => 'find text about spring flowers', 
                       :start_in => "#{Time.parse("05-07-2009 19:00")}", 
                       :finish_by => Time.parse("05-08-2009 19:00")) 
end

When /^I choose task to update and changes fields with new values and click update$/ do
  visit '/login'
  fill_in 'Email',  :with => @user.email
  fill_in 'Password', :with => @user.password
  click_button 'Login'
  click_link 'find text about spring flowers'
  click_link 'Edit'
  fill_in 'Body', :with => "find text about spring flowers and their pictures"
  click_button 'Update Task'
end

Then /^I see page with updated task values$/ do
  page.should have_content"Task was successfully updated."
  page.should have_content("find text about spring flowers and their pictures")
end
