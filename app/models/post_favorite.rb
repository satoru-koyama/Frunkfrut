class PostFavorite < ApplicationRecord
  # 関連付け
  belongs_to :user
  belongs_to :post

  # バリデーション

end
