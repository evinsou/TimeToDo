Given /^I am on the main page without account$/ do
  @user = User.new(:id => 1,:email => 'zach@mailsen.com', :password => '1234')
  visit root_path
end

When /^click new user and fill form$/ do
  click_link 'New user'
  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => @user.password
  fill_in 'Password confirmation', :with => @user.password
  click_button 'Create User'
end
Then /^I am on main page and see message$/ do
  page.should have_content("User successfully added.")
#  @user.should_not be_new_record
end

