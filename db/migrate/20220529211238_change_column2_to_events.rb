class ChangeColumn2ToEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :end_date
    add_column :events, :end_date, :datetime
  end
end
