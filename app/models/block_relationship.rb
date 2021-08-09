class BlockRelationship < ApplicationRecord
  # 関連付け
  belongs_to :blocking_user, class_name: :User, foreign_key: :block_id
  belongs_to :blocked_user, class_name: :User, foreign_key: :blocked_id

end
