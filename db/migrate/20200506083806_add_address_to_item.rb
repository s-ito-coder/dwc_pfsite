class AddAddressToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :address, :string
  end
end
