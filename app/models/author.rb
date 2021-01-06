class Author < ApplicationRecord
  has_secure_password
  attr_accessor :email, :password, :password_confirmation
  validates_uniqueness_of :email
  validates :password, presence: true, format: {with: /\A(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W]).{8,}\z/}
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/}
  validates :first_name, :last_name, presence: true
  has_many :posts
  has_many :comments

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
end
