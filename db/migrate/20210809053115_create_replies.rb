class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|

      t.timestamps
      t.integer :comment_id, null: false
      t.integer :user_id, null: false
      t.text :text, null: true
      t.string :reply_image_id, null: true
      t.boolean :is_deleted, null: false, default: false

    end
  end
end
