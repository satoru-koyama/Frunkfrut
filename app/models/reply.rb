class Reply < ApplicationRecord
  # 関連付け
  belongs_to :comment
  belongs_to :user
  has_many :reply_reports, dependent: :destroy
  has_many :reply_favorites, dependent: :destroy

end
