class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.references :user, null: false, foreign_key: true
      t.string :start_date
      t.string :end_date
      t.string :title
      t.text :description
      t.string :city

      t.timestamps
    end
  end
end
