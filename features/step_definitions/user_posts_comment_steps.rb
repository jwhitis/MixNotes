Given(/^mix "(.*?)" has the following comments:$/) do |title, comments_table|
  user = User.where(:email => "me@example.com").first
  mix = Mix.where(:title => title).first
  comment = mix.comments.build(comments_table.hashes).first
  comment.user = user
  comment.save
end

When(/^I view mix "(.*?)"$/) do |title|
  mix = Mix.where(:title => title).first
  visit mix_path(mix.id)
end