class RenamePostImageIdColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :post_image_id, :image_id
  end
end
