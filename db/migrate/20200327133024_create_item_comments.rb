class CreateItemComments < ActiveRecord::Migration[5.2]
  def change
    create_table :item_comments do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.string :comment
      t.timestamps
    end
  end
end
