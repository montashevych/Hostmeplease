class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :title
      t.string :type
      t.text :description
      t.float :price
      t.boolean :status

      t.timestamps
    end
  end
end
