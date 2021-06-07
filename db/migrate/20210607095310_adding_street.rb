class AddingStreet < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :street, :string
  end
end
