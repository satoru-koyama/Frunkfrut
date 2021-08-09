class CreatePostReports < ActiveRecord::Migration[5.2]
  def change
    create_table :post_reports do |t|

      t.timestamps
      t.integer :post_id, null: false
      t.integer :user_id, null: false

    end
  end
end
