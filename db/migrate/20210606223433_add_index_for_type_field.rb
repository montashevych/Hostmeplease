class AddIndexForTypeField < ActiveRecord::Migration[6.1]
  def change
    add_index :places, :type
  end
end
