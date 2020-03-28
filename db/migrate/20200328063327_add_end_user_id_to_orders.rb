class AddEndUserIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :end_user_id, :integer
    add_column :orders, :postal_code, :string
    add_column :orders, :ship_to, :string
    add_column :orders, :payment, :integer
    add_column :orders, :postage, :integer
    add_column :orders, :price, :integer
    add_column :orders, :order_status, :integer
  end
end
