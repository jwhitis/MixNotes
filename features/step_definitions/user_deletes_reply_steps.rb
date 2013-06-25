Given(/^comment "(.*?)" has the following replies:$/) do |content, replies_table|
  user = User.where(:email => "me@example.com").first
  comment = Comment.where(:content => content).first
  reply = comment.replies.build(replies_table.hashes).first
  reply.user = user
  reply.save
end