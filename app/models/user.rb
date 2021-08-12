class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :user_image

  # 関連付け
  has_many :following_relationships, class_name: :FollowRelationship, foreign_key: :follow_id, dependent: :destroy
  has_many :followed_relationships, class_name: :FollowRelationship, foreign_key: :followed_id, dependent: :destroy
  has_many :followed_users, through: :following_relationships, source: :followed_user
  has_many :following_users, through: :followed_relationships, source: :following_user

  has_many :blocking_relationships, class_name: :BlockRelationship, foreign_key: :block_id, dependent: :destroy
  has_many :blocked_relationships, class_name: :BlockRelationship, foreign_key: :blocked_id, dependent: :destroy
  has_many :blocked_users, through: :blocking_relationships, source: :blocked_user
  has_many :blocking_users, through: :blocked_relationships, source: :blocking_user

  has_many :posts
  has_many :post_reports, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :comments
  has_many :comment_reports, dependent: :destroy
  has_many :comment_favorites, dependent: :destroy
  has_many :replies
  has_many :reply_reports, dependent: :destroy
  has_many :reply_favorites, dependent: :destroy

  # バリデーション
  validates :name, presence: :true, length: { maximum: 50 }
  validates :profile, length: { maximum: 500 }
  validates :nickname, length: { maximum: 25 }

  def this_week_favorite_count
    total_count = 0
    [self.post_favorites, self.comment_favorites, self.reply_favorites].each do |favorites|
      t = Date.today
      case t.wday
      when 0
        finish_day = t
      when 1
        finish_day = t - 1
      when 2
        finish_day = t - 2
      when 3
        finish_day = t - 3
      when 4
        finish_day = t - 4
      when 5
        finish_day = t - 5
      when 6
        finish_day = t - 6
      end
      count = favorites.where("? = 1", created_at <=> finish_day).count
      total_count += count
    end
    return total_count
  end

  def day30_favorite_count
    total_count = 0
    [self.post_favorites, self.comment_favorites, self.reply_favorites].each do |favorites|
      t = Date.today - 31
      count = favorites.where("? = 1", created_at <=> t).count
      total_count += count
    end
    return total_count
  end

  def total_favorite_count
    self.post_favorites.all.count + self.comment_favorites.all.count + self.reply_favorites.all.count
  end

  def report_count
    self.post_reports.all.count + self.comment_reports.all.count + self.reply_reports.all.count
  end
end
