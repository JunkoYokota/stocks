class Stock < ApplicationRecord
  scope :recent, -> { order(expiration: :asc)}
  belongs_to :user
end
