When(/^I go to the home page$/) do
  visit '/'
end

Then(/^I should be on the page with the title: "(.*?)"$/) do |arg1|
  expect(page).to have_title arg1
end

