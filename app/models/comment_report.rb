class CommentReport < ApplicationRecord
  # 関連付け
  belongs_to :comment
  belongs_to :user

end
