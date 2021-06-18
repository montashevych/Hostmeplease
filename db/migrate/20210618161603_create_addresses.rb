class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.string :state_region
      t.string :details

      t.timestamps
    end
  end
end
