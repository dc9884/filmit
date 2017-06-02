class Location < ApplicationRecord

  validates :location_name, presence: true
  validates :location_size, presence: true
  validates :location_address, presence: true

  has_many :permits, :dependent => :destroy
end
