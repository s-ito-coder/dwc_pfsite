class AddColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :item_name, :string
    add_column :orders, :image_id, :string
    add_column :orders, :item_id, :string
  end
end
