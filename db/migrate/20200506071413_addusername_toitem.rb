class AddusernameToitem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :ex_username, :string
  end
end
