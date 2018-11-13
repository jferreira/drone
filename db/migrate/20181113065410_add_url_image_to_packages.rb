class AddUrlImageToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :url_image, :string
  end
end
