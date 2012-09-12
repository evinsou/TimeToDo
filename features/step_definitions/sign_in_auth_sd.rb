Given /^I am not logged user created$/ do
  @user = User.create!(:id => 1,:email => 'zach@mailsen.com', :password => '1234')
end

When /^click log in and fill form with email and password$/ do
  visit root_path
  save_and_open_page
  click_link 'Login'
  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => @user.password
  click_button 'Login'
end
Then /^i am on main page and see that logged$/ do
  page.should have_content("Logged in successfully")
end

