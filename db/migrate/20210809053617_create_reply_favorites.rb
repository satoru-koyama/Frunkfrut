class CreateReplyFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_favorites do |t|

      t.timestamps
      t.integer :reply_id, null: false
      t.integer :user_id, null: false

    end
  end
end
