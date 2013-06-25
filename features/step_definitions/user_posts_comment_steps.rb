Given(/^I posted the following comments in mix "(.*?)":$/) do |title, comments_table|
  user = User.where(:email => "me@example.com").first
  mix = Mix.where(:title => title).first
  comments = mix.comments.build(comments_table.hashes)
  comments.each do |comment|
    comment.user = user
    comment.save
  end
end

Given(/^user "(.*?)" posted the following comments in mix "(.*?)":$/) do |email, title, comments_table|
  user = User.where(:email => email).first
  mix = Mix.where(:title => title).first
  comments = mix.comments.build(comments_table.hashes)
  comments.each do |comment|
    comment.user = user
    comment.save
  end
end

When(/^I view mix "(.*?)"$/) do |title|
  mix = Mix.where(:title => title).first
  visit mix_path(mix.id)
end