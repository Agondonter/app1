class ChangeColourToPriceInProductsAndAddAudioUrl < ActiveRecord::Migration[5.2]
  def change
  	rename_column :products, :colour, :price
  	change_column :products, :price, :decimal
   	add_column :products, :audio, :string
  end
end
