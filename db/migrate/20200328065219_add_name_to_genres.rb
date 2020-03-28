class AddNameToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :name, :string
    add_column :genres, :is_displayed, :boolean
  end
end
