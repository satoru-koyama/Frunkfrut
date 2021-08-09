class CreateBlockRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :block_relationships do |t|

      t.timestamps
      t.integer :block_id, null: false
      t.integer :blocked_id, null: false

    end
  end
end
