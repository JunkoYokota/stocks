class Stock < ApplicationRecord
  scope :recent, -> { order(expiration: :asc)}
  scope :stocks_near, -> { where(expiration: Date.today + 90) }
  scope :stocks_expire, -> { where('expiration <= ?', Date.today) }

  belongs_to :user
end
