class AddColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :exhibition_username, :string
    add_column :orders, :item_name, :string
  end
end
