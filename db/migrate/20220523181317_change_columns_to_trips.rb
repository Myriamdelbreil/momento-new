class ChangeColumnsToTrips < ActiveRecord::Migration[6.1]
  def change
    change_column :trips, :start_date, :datetime
    change_column :trips, :end_date, :datetime
  end
end
