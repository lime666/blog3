class Comment < ApplicationRecord
  validates :body, presence: true
  validates :status, presence: true

  belongs_to :post, counter_cache: true
  belongs_to :author

  enum status: [:published, :unpublished], _default: "unpublished"
end
