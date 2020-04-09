class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.string :postal_code, null: false
      t.string :ship_to, null: false
      t.string :consignee, null: false
      t.integer :total_price, null: false
      t.integer :order_status, null: false, default: 0
      t.timestamps
    end
  end
end
