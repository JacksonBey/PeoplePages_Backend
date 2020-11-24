class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  validates :content, length: {minimum: 1}
end
