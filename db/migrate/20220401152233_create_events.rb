class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :participant, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
      t.datetime :description
      t.datetime :start_date
      t.string :end_date
      t.string :category

      t.timestamps
    end
  end
end
