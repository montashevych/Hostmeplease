class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :title
      t.string :type
      t.text :description
      t.float :price
      t.boolean :status
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
