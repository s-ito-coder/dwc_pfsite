class AddNameToItemComments < ActiveRecord::Migration[5.2]
  def change
    add_column :item_comments, :item_id, :integer
    add_column :item_comments, :is_displayed, :boolean
  end
end
