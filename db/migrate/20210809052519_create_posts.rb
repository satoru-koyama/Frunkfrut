class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.timestamps
      t.integer :user_id, null: false
      t.text :text, null: true
      t.string :post_image_id, null: true
      t.boolean :is_deleted, null: false, default: false
      
    end
  end
end
