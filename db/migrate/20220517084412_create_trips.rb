class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.belongs_to :departure, foreign_key: { to_table: :locations }, index: true, null: false
      t.belongs_to :arrival, foreign_key: { to_table: :locations }, index: true, null: false
      t.datetime :departure_time
      t.integer :seats, :default => 20

      t.timestamps
    end
  end
end
