class AddEmailToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :email, :string
    add_column :items, :postal_code, :string
  end
end
