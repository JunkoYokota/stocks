# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "csv"

stocks_csv = CSV.readlines("db/stocks.csv", headers: true)
stocks_csv.each do |row|
  Stock.create(
    id: row['id'],
    product_name: row['product_name'],
    expiration: row['expiration'],
    open_date: row['open_date'],
    detail: row['detail'],
    created_at: row['created_at'],
    updated_at: row['updated_at'])
end

# users_csv = CSV.readlines("db/users.csv", headers: true)
# users_csv.each do |row_u|
#   User.create!(
#     id: row_u['id'],
#     email: row_u['email'],
#     user_name: row_u['user_name'],
#     encrypted_password: row_u['encrypted_password'],
#     reset_password_token: row_u['reset_password_token'],
#     reset_password_sent_at: row_u['reset_password_sent_at'],
#     remember_created_at: row_u['remember_created_at'],
#     created_at: row_u['created_at'],
#     updated_at: row_u['updated_at'])
# end
