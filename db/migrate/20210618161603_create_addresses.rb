class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :country, null: false
      t.string :city, null: false
      t.string :state_region, null: false
      t.string :details, null: false

      t.timestamps
    end
  end
end
