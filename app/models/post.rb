class Post < ApplicationRecord

  attachment :post_image

  # 関連付け
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_reports, dependent: :destroy
  has_many :post_favorites, dependent: :destroy

  # バリデーション

end
