class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :FirstName,              null: false, default: ""
      t.string :LastName,               null: false, default: ""
      t.string  :role,                  null: false, default: "consumer"
      t.string :email,                  null: false, default: ""
      t.text :message,                  null: false, default: ""

      t.timestamps
    end
  end
end
