class AddForeignKeyToPlaces < ActiveRecord::Migration[6.1]
  def change
    add_reference :places, :user, index: true
  end
end
