class ReplyReport < ApplicationRecord
  # 関連付け
  belongs_to :reply
  belongs_to :user

  # バリデーション

end
