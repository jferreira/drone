class AddLocationToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :location, :string
  end
end
