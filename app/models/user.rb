class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

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
  has_many :rankings, dependent: :destroy

  has_many :followed_user_posts, through: :followed_users, source: :posts
  has_many :commented_posts, through: :comments, source: :post

  # バリデーション
  validates :name, presence: :true, length: { maximum: 50 }
  validates :profile, length: { maximum: 500 }
  validates :nickname, length: { maximum: 25 }

  def week_count
    total_count = 0
    now_time = Time.zone.now
    t = Time.parse("#{now_time.year}-#{now_time.month}-#{now_time.day}")
    [self.post_favorites, self.comment_favorites, self.reply_favorites].each do |favorites|
      case t.wday
      when 0
        start_time = t
      when 1
        start_time = t - ( 60 * 60 * 24 * 1 )
      when 2
        start_time = t - ( 60 * 60 * 24 * 2 )
      when 3
        start_time = t - ( 60 * 60 * 24 * 3 )
      when 4
        start_time = t - ( 60 * 60 * 24 * 4 )
      when 5
        start_time = t - ( 60 * 60 * 24 * 5 )
      when 6
        start_time = t - ( 60 * 60 * 24 * 6 )
      end
      count = favorites.where("created_at > ?", start_time ).count
      total_count += count
    end
    return total_count
  end

  def day30_count
    total_count = 0
    [self.post_favorites, self.comment_favorites, self.reply_favorites].each do |favorites|
      now_time = Time.zone.now
      t = Time.parse("#{now_time.year}-#{now_time.month}-#{now_time.day}")
      start_time = t - ( 60 * 60 * 24 * 30 )
      count = favorites.where("created_at > ?", start_time ).count
      total_count += count
    end
    return total_count
  end

  def total_count
    self.post_favorites.all.count + self.comment_favorites.all.count + self.reply_favorites.all.count
  end

  def report_count
    self.post_reports.all.count + self.comment_reports.all.count + self.reply_reports.all.count
  end

  # 退会済み(is_deleted==true)のユーザーを弾くためのメソッドを作成
  # active_for_authentication?　はアクティブなユーザーの場合にtrueを返す
  def active_for_authentication?
    super && (self.is_deleted == false)
  end


end
