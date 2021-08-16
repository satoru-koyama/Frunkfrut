class AddShuffleIdToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :shuffle_id, :integer, null: true
  end
end
