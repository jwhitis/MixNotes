Given(/^I posted the following replies to comment "(.*?)":$/) do |content, replies_table|
  user = User.where(:email => "me@example.com").first
  comment = Comment.where(:content => content).first
  replies = comment.replies.build(replies_table.hashes)
  replies.each do |reply|
    reply.user = user
    reply.save
  end
end

Given(/^user "(.*?)" posted the following replies to comment "(.*?)":$/) do |email, content, replies_table|
  user = User.where(:email => email).first
  comment = Comment.where(:content => content).first
  replies = comment.replies.build(replies_table.hashes)
  replies.each do |reply|
    reply.user = user
    reply.save
  end
end