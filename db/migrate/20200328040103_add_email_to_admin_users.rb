class AddEmailToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :email, :string
    add_column :admin_users, :encrypted_password, :string
  end
end
