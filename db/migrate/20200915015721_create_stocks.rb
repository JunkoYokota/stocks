class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :product_name
      t.date :expiration
      t.date :open_date
      t.text :detail
      t.timestamps
    end
  end
end
