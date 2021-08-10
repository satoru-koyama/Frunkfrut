class Post < ApplicationRecord

  attachment :post_image

  # 関連付け
  belongs_to :user
  has_many :comments
  has_many :post_reports, dependent: :destroy
  has_many :post_favorites, dependent: :destroy

  # バリデーション
  validates :text, presence: true, unless: :post_image
  validates :post_image, presence: true, unless: :text


  def countdown
    now = Time.current
    return self.created_at.since(3.days) - now
  end


end
