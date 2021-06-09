class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :title, null: false
      t.string :type
      t.text :description, null: false
      t.float :price, default: 0, null: false
      t.integer :status, null: false
      t.boolean :is_active, null: false

      t.timestamps
    end
  end
end
