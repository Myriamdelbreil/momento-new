class CreateAccomodations < ActiveRecord::Migration[6.1]
  def change
    create_table :accomodations do |t|
      t.references :trip, null: false, foreign_key: true
      t.boolean :confirmed
      t.string :address
      t.string :url
      t.string :title
      t.text :description
      t.float :price
      t.string :img
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
