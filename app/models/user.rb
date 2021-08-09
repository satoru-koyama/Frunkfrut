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

  has_many :posts, dependent: :destroy
  has_many :post_reports, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comments_reports, dependent: :destroy
  has_many :comments_favorites, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :reply_reports, dependent: :destroy
  has_many :reply_favorites, dependent: :destroy

  # バリデーション
  validates :name, presence: :true, length: { maximum: 50 }
  validates :profile, length: { maximum: 500 }
  nickname :nickname, length: { maximum: 25 }



end
