Given(/^the user "(.*?)" with password "(.*?)"$/) do |email, password|
  user = User.create(email: email, password: password)
  refute user.new_record?
end

When(/^I go to the homepage$/) do
  visit "/"
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field, with: value
end

When(/^I press "(.*?)"$/) do |text|
  click_button text
end

Then(/^I should see "(.*?)"$/) do |content|
  page.should have_content(content)
end

Then(/^I should not see "(.*?)"$/) do |content|
  page.should_not have_content(content)
end