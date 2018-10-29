class CorrectUserId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :orders, :used_id, :user_id
  end
end
