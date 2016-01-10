class Comment < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  validates :name, presence: true, length: { minimum: 3 }
  validates :body, presence: true,  length: { in: 1..160 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
end
