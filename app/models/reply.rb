class Reply < ActiveRecord::Base
  attr_accessible :content, :comment_id, :user_id
  validates_presence_of :content, :message => "Please type your reply in the text box."
  belongs_to :comment
  belongs_to :user
  include Formattable
end
