class RemoveColumnFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :payment, :integer
    remove_column :orders, :postage, :integer
  end
end
