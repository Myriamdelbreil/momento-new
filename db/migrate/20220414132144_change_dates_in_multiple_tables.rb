class ChangeDatesInMultipleTables < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :expense_date, :datetime
  end
end
