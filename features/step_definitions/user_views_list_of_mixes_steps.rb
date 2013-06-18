Given(/^the user "(.*?)" has the following mixes:$/) do |email, mixes_table|
  user = User.create(:email => email, :password => "password1")
  user.mixes.create(mixes_table.hashes)
end

Given(/^I am signed in$/) do
  User.create(:email => "me@example.com", :password => "password1")
  visit "/"
  fill_in "Email", with: "me@example.com"
  fill_in "Password", with: "password1"
  click_button "Sign in"
end

Given(/^I have the following mixes:$/) do |mixes_table|
  user = User.where(:email => "me@example.com").first
  user.mixes.create(mixes_table.hashes)
end