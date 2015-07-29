Given /^I am not logged in$/ do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, "/logout", {}
  ensure
    Capybara.current_driver = current_driver
  end
end

When /I click the link with the text: "(.*?)"/ do |arg1|
  click_on arg1
end

When /I should see the text: "(.*?)"/ do |arg1|
  expect(page).to have_content(arg1)
end

When /I sign in as "(.*?)" with password "(.*?)"/ do |arg1, arg2|
  within("#login_popup") do
    fill_in 'Email', :with => arg1
    fill_in 'Password', :with => arg2
  end
  click_button 'Log in'
end

Given /^the user "(.*?)" is signed in$/ do |arg1|
  @current_user = FactoryGirl.build(:user, email: arg1)
  login_as(@current_user, :scope => :user)
end

def find_modal_element(modal_element_id)
  page.find(modal_element_id).visible?
end

Then /^I should see the login popup$/ do
 modal_element_id = "#login_popup"
 find_modal_element(modal_element_id)
 expect(page.find(modal_element_id)).to have_content("Log in")
end
