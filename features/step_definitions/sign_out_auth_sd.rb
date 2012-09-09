Given /^i am logged$/ do
  @user = User.create!(:id => 1,:email => 'zach@mailsen.com', :password => '1234')
  visit root_path
  click_link 'Login'
  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => @user.password
  click_button 'Login'
end

When /^click log out$/ do
  click_link 'Logout'
end
Then /^i am on main page and see a log out message$/ do
  page.should have_content("You successfully logout")
end

