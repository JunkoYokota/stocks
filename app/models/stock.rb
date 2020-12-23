class Stock < ApplicationRecord
  has_rich_text :content
  validates :product_name, length: { maximum: 13 }, presence: true
  validate :validate_content_length
  validate :validate_content_attachment_byte_size
  validate :validate_content_attachments_count
  scope :recent, -> { order(expiration: :asc)}
  scope :stocks_near, -> { where(expiration: Date.today + 90) }
  scope :stocks_expire, -> { where('expiration <= ?', Date.today) }
  belongs_to :user


  MAX_CONTENT_LENGTH = 50
  ONE_KILOBYTE = 1024
  MEGA_BYTES = 4
  MAX_CONTENT_ATTACHMENT_BYTE_SIZE = MEGA_BYTES * 1_000 * ONE_KILOBYTE
  MAX_CONTENT_ATTACHMENTS_COUNT = 2

  # images = content.embeds.blobs
  # images = ActiveStorage::Blob

  private
  def validate_content_length
    if content.to_plain_text.length > MAX_CONTENT_LENGTH
      errors.add(:content, :too_long)
    end
  end
  def validate_content_attachment_byte_size
    # content.body.attachables.grep(ActiveStorage::Blob).each do |attachable|
    #   if attachable.byte_size > MAX_CONTENT_ATTACHMENT_BYTE_SIZE
    #     errors.add(
    #       :base,
    #       :content_attachable_byte_size_is_oversize,
    #       max_content_attachment_mega_byte_size: MEGA_BYTES,
    #       bytes: attachable.byte_size,
    #       max_bytes: MAX_CONTENT_ATTACHMENT_BYTE_SIZE
    #     )
    #   end
    # end
  end
  def validate_content_attachments_count
    # if content.body.attachables.grep(ActiveStorage::Blob).count >
    #   MAX_CONTENT_ATTACHMENTS_COUNT
    #     errors.add(
    #       :base, 
    #       :attachment_count_is_too_many,
    #       max_count: MAX_CONTENT_ATTACHMENTS_COUNT
    #     )
    # end
  end
end
