class Post < ApplicationRecord
  # 関連付け
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_reports, dependent: :destroy
  has_many :post_favorites, dependent: :destroy

end
