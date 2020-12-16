class Post < ApplicationRecord
  validates :title ,presence: true, length: { maximum: 100}
  validates :content, presence: true, length: { in: 500..2500 }
end
