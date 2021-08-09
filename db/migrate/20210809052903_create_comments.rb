class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.timestamps
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      t.text :text, null: true
      t.string :comment_image_id, null: true
      t.boolean :is_deleted, null: false, default: false

    end
  end
end
