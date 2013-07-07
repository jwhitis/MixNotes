When(/^I go to the activity page$/) do
  visit user_path
end

Then(/^the notification count should be "(.*?)"$/) do |number|
  counter = find("#count").text
  counter.should eq(number)
end