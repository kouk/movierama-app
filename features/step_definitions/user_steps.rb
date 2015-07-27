Given /^I am not logged in$/ do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, "/users/sign_out", {}
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
  within("#session") do
    fill_in 'Email', :with => arg1
    fill_in 'Password', :with => arg2
  end
  click_button 'Sign in'
end

