class AddConsumedToStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :consumed, :boolean, default: true, null: false
  end
end
