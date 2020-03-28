class AddFirstNameToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :first_name, :string
    add_column :end_users, :first_name_kana, :string
    add_column :end_users, :last_name, :string
    add_column :end_users, :last_name_kana, :string
    add_column :end_users, :postal_code, :string
    add_column :end_users, :address, :string
    add_column :end_users, :phone_number, :string
    add_column :end_users, :email, :string
    add_column :end_users, :encrypted_password, :string
    add_column :end_users, :is_deleted, :boolean
  end
end
