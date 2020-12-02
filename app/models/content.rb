class Content < ApplicationRecord
  include ActionText
  belongs_to :stock
  belongs_to :user
  has_one :body

end