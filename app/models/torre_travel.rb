class TorreTravel < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  has_many :images, dependent: :destroy

  enum housing: [:house, :flat, :bungalo, :chelet]
  enum distance: [:first_line, :second_line]
  enum reserved: [:reserv, :unreserv]

  validates :description, presence: true,
            length: { minimum: 5 }
  validates :description_es, presence: true,
            length: { minimum: 5 }
  validates :price, presence: true
  validates :housing, presence: true
  def self.restricted_statuses
    statuses.except :failed, :destroyed
  end
end
