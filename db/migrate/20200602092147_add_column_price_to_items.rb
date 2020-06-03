class AddColumnPriceToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :listed_price_boost, :integer
  end
end
