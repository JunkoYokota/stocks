class Stock < ApplicationRecord
  scope :recent, -> { order(expiration: :asc)}
end
