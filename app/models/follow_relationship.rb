class FollowRelationship < ApplicationRecord
  # 関連付け
  belongs_to :following_user, class_name: :User, foreign_key: :follow_id
  belongs_to :followed_user, class_name: :User, foreign_key: :followed_id

end
