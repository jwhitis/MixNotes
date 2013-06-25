Given(/^I add user "(.*?)" to mix "(.*?)"$/) do |email, title|
  user = User.where(:email => email).first
  mix = Mix.where(:title => title).first
  mix.permissions.create(:user_id => user.id) unless user.nil?
end