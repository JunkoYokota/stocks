class AddTagsToStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :tags, :boolean, default: false, null: false
    add_column :stocks, :favorites, :boolean, default: false, null: false
  end
end
