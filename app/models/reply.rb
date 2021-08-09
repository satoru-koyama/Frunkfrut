class Reply < ApplicationRecord

  attachment :reply_image

  # 関連付け
  belongs_to :comment
  belongs_to :user
  has_many :reply_reports, dependent: :destroy
  has_many :reply_favorites, dependent: :destroy

  # バリデーション
  validates :text, presence: true, unless: :reply_image
  validates :reply_image, presence: true, unless: :text

end
