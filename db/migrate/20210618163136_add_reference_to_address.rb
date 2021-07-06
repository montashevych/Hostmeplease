class AddReferenceToAddress < ActiveRecord::Migration[6.1]
  def change
    add_reference :addresses, :place, index: true
  end
end
