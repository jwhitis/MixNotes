class Reply < ActiveRecord::Base
  attr_accessible :content, :comment_id, :user_id
  belongs_to :comment
  belongs_to :user
  include Formattable
end
