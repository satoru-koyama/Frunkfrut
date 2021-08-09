class Comment < ApplicationRecord
  # 関連付け
  belongs_to :post
  belongs_to :user
  has_many :replies, dependent: :destroy
  has_many :comments_reports, dependent: :destroy
  has_many :comments_favorites, dependent: :destroy

  # バリデーション

end
