class RenameCommentImageIdColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :comment_image_id, :image_id
  end
end
