class CreateTransportations < ActiveRecord::Migration[6.1]
  def change
    create_table :transportations do |t|
      t.references :participant, null: false, foreign_key: true
      t.float :price
      t.string :origin
      t.string :destination
      t.string :type
      t.datetime :departure_date
      t.datetime :arrival_date
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
