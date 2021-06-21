class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :image
      t.references :imageable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
