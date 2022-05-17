class AddExtraLuggageToPassengers < ActiveRecord::Migration[7.0]
  def up
    add_column :passengers, :extra_luggage, :integer, default: 0
  end

  def down
    remove_column :passengers, :extra_luggage
  end
end
