Given(/^I have access to mix "(.*?)"$/) do |title|
  user = User.where(:email => "me@example.com").first
  mix = Mix.where(:title => title).first
  mix.permissions.create(:user_id => user.id)
end