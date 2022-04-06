class ChangeColumnToTransportation < ActiveRecord::Migration[6.1]
  def change
    rename_column :transportations, :type, :mean
  end
end
