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

  #NEED CUSTOM VALIDATION FOR DATE AND TIME HERE

  belongs_to :movie
  belongs_to :user
  belongs_to :location



end
