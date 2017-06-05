# == Schema Information
#
# Table name: permits
#
#  id          :integer          not null, primary key
#  movie_id    :integer
#  location_id :integer
#  booked_time :datetime
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Permit < ApplicationRecord

  validates :booked_time, presence: true
  validates :booked_end, presence: true

  belongs_to :movie
  belongs_to :user
  belongs_to :location

  validate :location_not_already_booked

    def location_not_already_booked
      same_location_permits = self.location.permits

      start_time_overlaps = same_location_permits.where(:booked_time => self.booked_time..self.booked_end)

      end_time_overlaps = same_location_permits.where(:booked_end => self.booked_time..self.booked_end)

      if start_time_overlaps.any? || end_time_overlaps.any?
        errors.add(:location_id, "The selected location is already booked during that time.")
      end
    end

end
