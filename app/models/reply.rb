class Reply < ApplicationRecord

  attachment :image

  # 関連付け
  belongs_to :comment
  belongs_to :user
  has_many :reply_reports, dependent: :destroy
  has_many :reply_favorites, dependent: :destroy

  # バリデーション
  validates :text, presence: true, unless: :image
  validates :image, presence: true, unless: :text

end
