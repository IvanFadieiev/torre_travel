# class of the housing
class TorreTravel < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  has_many :images, dependent: :destroy

  after_create  :create_tt
  after_update  :update_tt
  after_destroy :destroy_tt

  enum housing: [:house, :flat, :bungalo, :chelet]
  enum distance: [:first_line, :second_line]
  enum reserved: [:reserv, :unreserv]

  validates :description, presence: true, length: { minimum: 5 }
  validates :description_es, presence: true, length: { minimum: 5 }
  validates :price, presence: true
  validates :housing, presence: true

  def self.restricted_statuses
    statuses.except :failed, :destroyed
  end

  def create_tt
    AdminMailer.new_housing(self).deliver_now
  end

  def update_tt
    AdminMailer.edit_housing(self).deliver_now
  end

  def destroy_tt
    AdminMailer.torre_travel_destroyed(self).deliver_now
  end
end
