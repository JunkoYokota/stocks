# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

stocks_csv = CSV.readlines("db/stocks_view.csv", headers: true)
stocks_csv.each do |row|
  Stock.create!(
    id: row['id'],
    product_name: row['product_name'],
    expiration: row['expiration'],
    open_date: row['open_date'],
    detail: row['detail'],
    created_at: row['created_at'],
    updated_at: row['updated_at'],
    consumed: row['consumed'],
    user_id: row['user_id'],
    tags: row['tags'],
    favorites: row['favorites'],
  )
end
