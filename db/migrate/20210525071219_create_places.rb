class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :title, default: '', null: false
      t.string :type
      t.text :description, default: '', null: false
      t.float :price, default: 0, null: false
      t.boolean :status, default: true, null: false

      t.timestamps
    end
  end
end
