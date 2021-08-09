class CreatePostFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :post_favorites do |t|

      t.timestamps
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      
    end
  end
end
