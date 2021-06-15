class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :picture_url
      t.string :name
      t.references :imageable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
