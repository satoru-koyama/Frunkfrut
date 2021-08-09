class CreateReplyReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_reports do |t|

      t.timestamps
      t.integer :reply_id, null: false
      t.integer :user_id, null: false

    end
  end
end
