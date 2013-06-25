When(/^I click "(.*?)"$/) do |text|
  click_link text
end

Then(/^I should be listed as the admin$/) do
  admin = find("#admin").text
  admin.should eq("me@example.com")
end
