When(/^I click element "(.*?)"$/) do |selector|
  find(selector).click
end

Given(/^user "(.*?)" has access to mix "(.*?)"$/) do |email, title|
  user = User.where(:email => email).first
  mix = Mix.where(:title => title).first
  mix.permissions.create(:user_id => user.id)
end