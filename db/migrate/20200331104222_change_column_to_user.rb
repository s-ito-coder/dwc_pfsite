class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  # 変更内容
  def up
    change_column :users, :postal_code, :string, null: true
  end

  # 変更前の状態
  def down
    change_column :users, :postal_code, :string, null: false
  end
end
