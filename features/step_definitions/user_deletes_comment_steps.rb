When(/^I click element "(.*?)"$/) do |selector|
  find(selector).click
end