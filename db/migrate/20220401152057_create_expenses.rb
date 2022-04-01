class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.references :participant, null: false, foreign_key: true
      t.float :amount
      t.string :title
      t.boolean :mutual

      t.timestamps
    end
  end
end
