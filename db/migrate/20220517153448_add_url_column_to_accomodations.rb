class AddUrlColumnToAccomodations < ActiveRecord::Migration[6.1]
  def up
    # add_column :accomodations, :url, :string
  end

  def down
    remove_column :accomodations, :url
  end
end
