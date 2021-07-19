class SetDefaultValuesToPlace < ActiveRecord::Migration[6.1]
  def change
    change_column :places, :is_active, :boolean, default: true
    change_column :places, :status, :integer, default: 0
  end
end
