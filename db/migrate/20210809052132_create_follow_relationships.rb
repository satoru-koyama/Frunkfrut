class CreateFollowRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_relationships do |t|

      t.timestamps
      t.integer :follow_id, null: false
      t.integer :followed_id, null: false

    end
  end
end
