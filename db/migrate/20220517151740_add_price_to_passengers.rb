class AddPriceToPassengers < ActiveRecord::Migration[7.0]
  def up
    add_column :passengers, :price, :decimal, precision: 5, scale: 2
  end

  def down
    remove_column :passengers, :price
  end
end
