class AddCoordinatesToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :latitude, :float
    add_column :packages, :longitude, :float
  end
end
