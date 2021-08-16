class RenameReplyImageIdColumnToReplies < ActiveRecord::Migration[5.2]
  def change
    rename_column :replies, :reply_image_id, :image_id
  end
end
