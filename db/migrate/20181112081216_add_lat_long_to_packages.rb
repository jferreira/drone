class AddLatLongToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :lat, :integer
    add_column :packages, :long, :integer
  end
end
