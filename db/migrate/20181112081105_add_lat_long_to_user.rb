class AddLatLongToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lat, :integer
    add_column :users, :long, :integer
  end
end
