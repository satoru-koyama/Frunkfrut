class Comment < ApplicationRecord

  attachment :image

  # 関連付け
  belongs_to :post
  belongs_to :user
  has_many :replies
  has_many :comment_reports, dependent: :destroy
  has_many :comment_favorites, dependent: :destroy

  # バリデーション
  validates :text, presence: true, unless: :image
  validates :image, presence: true, unless: :text
end
