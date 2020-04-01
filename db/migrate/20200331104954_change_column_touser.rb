class ChangeColumnTouser < ActiveRecord::Migration[5.2]
  # 変更内容
  def up
    change_column :users, :address, :string, null: true
    change_column :users, :phone_number, :string, null: true
  end

  # 変更前の状態
  def down
    change_column :users, :address, :string, null: false
    change_column :users, :phone_number, :string, null: false
  end
end
