class Comment < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :body, presence: true,  length: { in: 1..200 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
end
