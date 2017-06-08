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
  validate :location_not_already_booked

    def location_not_already_booked
      same_location_permits = self.location.permits

      if :booked_time || :booked_end == nil

      else

        start_time_overlaps = same_location_permits.where(:booked_time => self.booked_time..self.booked_end)

        end_time_overlaps = same_location_permits.where(:booked_end => self.booked_time..self.booked_end)

        if start_time_overlaps.any? || end_time_overlaps.any?
          errors.add(:location_id, "The selected location is already booked during that time.")
        end
      end
    end

  validate :booked_time_cannot_be_in_the_past

    def booked_time_cannot_be_in_the_past

      if booked_time.present? && booked_time < Date.today
        errors.add(:booked_time, "cannot be in the past.")
      end
    end

    validate :booked_end_cannot_be_in_the_past

      def booked_end_cannot_be_in_the_past

        if booked_end.present? && booked_end < Date.today
          errors.add(:booked_end, "cannot be in the past.")
        end
      end

      validate :booked_end_cannot_be_before_booked_time

        def booked_end_cannot_be_before_booked_time

          if booked_end.present? && booked_end < booked_time
            errors.add(:booked_end, "cannot be before start time.")
          end
        end

  belongs_to :movie
  belongs_to :user
  belongs_to :location



end
