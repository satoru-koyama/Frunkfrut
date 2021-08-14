class Post < ApplicationRecord

  attachment :image

  # 関連付け
  belongs_to :user
  has_many :comments
  has_many :post_reports, dependent: :destroy
  has_many :post_favorites, dependent: :destroy

  has_many :replies, through: :comments

  # バリデーション
  validates :text, presence: true, unless: :image
  validates :image, presence: true, unless: :text


  def countdown
    now = Time.zone.now
    finish_time = self.created_at + ( 60 * 60 * 24 * 3)
    t = ( finish_time - now).floor
    day = t / ( 60 * 60 * 24 )
    hour = (t / (60 * 60))% 24
    min = ( t / 60 ) % 60
    if t > ( 60 * 60 * 24 )
      return "#{day}日"
    elsif t > ( 60 * 60 )
      return "#{hour}時間"
    else
      return "#{min}分"
    end
  end


end
