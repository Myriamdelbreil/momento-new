class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :participant, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
