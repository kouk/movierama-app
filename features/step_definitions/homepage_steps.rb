When(/^I go to the home page$/) do
  visit '/'
end

Then(/^I should be on the page with the title: "(.*?)"$/) do |arg1|
  expect(page).to have_title arg1
end

And(/^I should see a link with the text: "(.*?)"$/) do |arg1|
  expect(page).to have_link(arg1)
end

Then /^I should see an input field named "(.*?)"$/ do |arg1|
 page.find_field(arg1).visible?
end
