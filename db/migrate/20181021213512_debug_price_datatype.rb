class DebugPriceDatatype < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :price, :decimal, using: 'price::decimal'
  end
end
