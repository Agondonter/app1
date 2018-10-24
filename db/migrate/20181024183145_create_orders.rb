class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :used_id
      t.integer :product_id
      t.float :total
    end
    add_index :orders, :used_id
    add_index :orders, :product_id
  end
end
