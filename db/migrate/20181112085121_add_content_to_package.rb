class AddContentToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :content, :string
  end
end
