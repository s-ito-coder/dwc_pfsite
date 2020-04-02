class ChangeDefaultToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :username, :string, default: "ななしのユーザー"
  end
end
