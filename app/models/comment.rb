class Comment < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :body, presence: true,  length: { in: 3..100 }
end
