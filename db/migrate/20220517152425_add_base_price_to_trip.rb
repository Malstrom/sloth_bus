class AddBasePriceToTrip < ActiveRecord::Migration[7.0]
  def up
    add_column :trips, :base_price, :decimal, precision: 5, scale: 2, :default=> 20.00, null: false
  end

  def down
    remove_column :trips, :base_price
  end
end
