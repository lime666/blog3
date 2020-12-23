class Post < ApplicationRecord
  validates :title ,presence: true, length: { maximum: 100}
  validates :content, presence: true, length: { in: 500..2500 }

  belongs_to :author
  has_many :comments
end
