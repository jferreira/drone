class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :title
      t.text :description
      t.string :url_image
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
