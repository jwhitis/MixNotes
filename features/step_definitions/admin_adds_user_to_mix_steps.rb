Then(/^"(.*?)" should be listed as a user$/) do |email|
  user_list = find("#user-list").text
  user_list.should have_content(email)
end

Then(/^"(.*?)" should not be listed as a user$/) do |email|
  user_list = find("#user-list").text
  user_list.should_not have_content(email)
end