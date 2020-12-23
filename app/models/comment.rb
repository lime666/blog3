class Comment < ApplicationRecord
  validates :body, :status, presence: true

  belongs_to :post
  belongs_to :author

  enum status: [:visible, :not_visible], _default: "not_visible"
end
