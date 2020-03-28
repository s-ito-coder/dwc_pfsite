class AddEndUserIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :end_user_id, :integer
    add_column :addresses, :postal_code, :string
    add_column :addresses, :ship_to, :string
    add_column :addresses, :consignee, :string
  end
end
