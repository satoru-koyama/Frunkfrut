class CreateRankings < ActiveRecord::Migration[5.2]
  def change
    create_table :rankings do |t|
      t.integer :user_id, null: false
      t.integer :week_count, null: false
      t.integer :day30_count, null: false
      t.integer :total_count, null: false
      t.timestamps
    end
  end
end
