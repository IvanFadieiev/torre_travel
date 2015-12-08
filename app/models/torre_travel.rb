class TorreTravel < ActiveRecord::Base
  has_many :images, dependent: :destroy
  enum housing: [:house, :flat, :bungalo, :chelet]
  enum distance: [:first_line, :second_line]
  validates :description, presence: true,
                    length: { minimum: 5 }
  validates :description_es, presence: true,
                    length: { minimum: 5 }
  validates :price, presence: true                  
end
