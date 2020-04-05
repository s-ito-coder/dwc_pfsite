class AddColumn2ToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :image2_id, :string
    add_column :items, :image3_id, :string
  end
end
