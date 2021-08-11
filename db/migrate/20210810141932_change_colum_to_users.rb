class ChangeColumToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :nickname, true
    change_column_null :users, :user_image_id, true
    change_column_null :users, :profile, true
  end
end
