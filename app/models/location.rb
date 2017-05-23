class Location < ApplicationRecord
  has_many :permits, :dependent => :destroy
end
